/* ******************************************************************************************************************************
PERANCANGAN	DATABASE KEPENDUDUKAN DI TINGKAT RT/RW
By Julio Rivaldo, Vincentius Sutanto, Putri Aurelia Shilo

List Transaction (View, Procedure, Function)
****************************************************************************************************************************** */

 SELECT * FROM Penduduk
 SELECT * FROM MsProvinsi
 SELECT * FROM MsKabKota
 SELECT * FROM MsKecamatan
 SELECT * FROM MsKelurahan
 SELECT * FROM MsRW
 SELECT * FROM MsRT
 SELECT * FROM Header_KK
 SELECT * FROM Detail_KK
 SELECT * FROM MsUser
 SELECT * FROM MsKeperluan
 SELECT * FROM SuratKeterangan
 SELECT * FROM DetailLampiran
 SELECT * FROM Pelaporan
 SELECT * FROM JenisTagihan
 SELECT * FROM VirtualAccount
 SELECT * FROM HeaderTagihan
 SELECT * FROM DetailTagihan


-- VIEW 1 : View untuk menampilkan domisili tiap KK --
CREATE VIEW ViewDomisili AS
	SELECT 
	Header_KK.No_KK,
	Alamat,
	NamaRT,
	NIK_KetuaRT,
	NamaRW,
	NIK_KetuaRW,
	NamaKelurahan,
	NamaKecamatan,
	NamaKabkota,
	NamaProvinsi
		FROM Header_KK, MsRT, MsRW, MsKelurahan, MsKecamatan, MsKabKota, MsProvinsi
		WHERE Header_KK.ID_RT = MsRT.ID_RT
		and Header_KK.ID_RW = MsRW.ID_RW
		and Header_KK.KodePos = MsKelurahan.KodePos
		and Header_KK.ID_Kecamatan = MsKecamatan.ID_Kecamatan
		and Header_KK.ID_KabKota = MsKabKota.ID_KabKota
		and Header_KK.ID_Provinsi = MsProvinsi.ID_Provinsi

SELECT * FROM ViewDomisili


-- FUNCTION 1 : Function untuk menampilkan nama Kepala Keluarga yang terdapat dalam KK --
CREATE FUNCTION GetKepalaKeluarga (@No_KK NUMERIC(16,0))
RETURNS VARCHAR (100)
AS
BEGIN
    DECLARE @KepalaKeluarga VARCHAR (100)
    SELECT @KepalaKeluarga = Penduduk.Nama
		FROM Header_KK, Detail_KK, Penduduk
		WHERE Header_KK.No_KK = Detail_KK.No_KK
		and Detail_KK.NIK = Penduduk.NIK
		and StatusHubungan like 'Kepala Keluarga'
		and Header_KK.No_KK = @No_KK
    RETURN(@KepalaKeluarga)
END
GO

SELECT dbo.GetKepalaKeluarga ('3578090301085043')
SELECT dbo.GetKepalaKeluarga ('3578090124789043')
SELECT dbo.GetKepalaKeluarga ('3578090808989090')


-- VIEW 2 : View untuk menampilkan data penduduk --
CREATE VIEW ViewPenduduk AS
	SELECT
	ViewDomisili.*,
	NamaKepala = dbo.GetKepalaKeluarga (Header_KK.No_KK),
	Penduduk.NIK,
	Nama,
	TempatLahir,
	TanggalLahir,
	JenisKelamin,
	Agama,
	Pekerjaan,
	StatusPerkawinan = [Status],
	StatusHubungan,
	Kewarganegaraan,
	NamaAyah,
	NamaIbu
		FROM Header_KK, Detail_KK, Penduduk, ViewDomisili
		WHERE Header_KK.No_KK = Detail_KK.No_KK
		and Detail_KK.NIK = Penduduk.NIK
		and Header_KK.No_KK = ViewDomisili.No_KK

SELECT * FROM ViewPenduduk


-- SProcedure 1 : Procedure untuk menampilkan data dalam suatu Kartu Keluarga --
CREATE PROCEDURE spDisplayKartuKeluarga @No_KK NUMERIC (16,0) AS 
	SELECT *
		FROM ViewPenduduk
		Where No_KK = @No_KK
	GO

EXEC spDisplayKartuKeluarga '3578090301085043'
EXEC spDisplayKartuKeluarga '3578090124789043'
EXEC spDisplayKartuKeluarga '3578090808989090'


-- FUNCTION 2 : Function untuk menampilkan Umur berdasarkan NIK --
CREATE FUNCTION GetUmur (@NIK NUMERIC(16,0))
RETURNS INT
AS
BEGIN
    DECLARE @Umur INT
	SELECT
	@Umur = DATEDIFF ( YEAR, TanggalLahir, GETDATE())
		FROM ViewPenduduk
		WHERE NIK = @NIK	
    RETURN(@Umur)
END
GO

SELECT dbo.GetUmur ('3578090101010006') --ATAS NAMA JULIO RIVALDO
SELECT dbo.GetUmur ('3578092401010003') --ATAS NAMA GUNAIDI SUTANTO
SELECT dbo.GetUmur ('3578091509890006') --ATAS NAMA SUKARMAJO


-- SProcedure 2 : Procedure untuk menampilkan Demografi umur yang terdapat dalam suatu RT -- 
	/* DEMOGRAFI UMUR :UMUR MUDA <18, UMUR PRODUKTIF 20-50, UMUR TUA 50< */
CREATE PROCEDURE spDemografiUmurPerRT @NIK_KetuaRT NUMERIC (16,0) AS
	SELECT NamaRT, RangeUmur, Jumlah = COUNT(RangeUmur) FROM (
		SELECT 
		ViewPenduduk.NamaRT, 
		ViewPenduduk.Nama, 
		Umur = dbo.GetUmur (NIK),
		CASE 
			WHEN dbo.GetUmur (NIK) >50 THEN 'UMUR KURANG PRODUKTIF'
			WHEN dbo.GetUmur (NIK) <18 THEN 'UMUR MUDA'
			ELSE 'UMUR PRODUKTIF'
		END AS RangeUmur
			FROM Header_KK, MsRT, ViewPenduduk
			WHERE Header_KK.ID_RT = MsRT.ID_RT
			and MsRT.NIK_KetuaRT = @NIK_KetuaRT
			and Header_KK.No_KK = ViewPenduduk.No_KK ) AS T
		GROUP BY NamaRT, RangeUmur
	GO

EXEC spDemografiUmurPerRT '3578067869800006'

-- VIEW 3 : View untuk menampilkan Log Surat Keterangan yang sudah lampau (diambil) --
CREATE VIEW ViewLogSuratKeterangan AS
	SELECT 
	No_SuratKeterangan,
	ViewPenduduk.No_KK,
	ViewPenduduk.NIK,
	Nama,
	ViewPenduduk.Alamat,
	ViewPenduduk.NamaRT,
	ViewPenduduk.NamaRW,
	JenisKelamin,
	Tujuan,
	MsKeperluan.Keperluan,
	SuratKeterangan.Keterangan
		FROM SuratKeterangan, MsUser, ViewPenduduk, MsKeperluan
		WHERE SuratKeterangan.ID_User = MsUser.ID_User
		and MsUser.NIK = ViewPenduduk.NIK 
		and SuratKeterangan.Keperluan = MsKeperluan.ID_Keperluan
		and FlagAmbil = 1 

SELECT * FROM ViewLogSuratKeterangan


-- SPROCEDURE 3 : Procedure untuk menampilkan Log Surat Keterangan berdasarkan NoKartuKeluarga
CREATE PROCEDURE spDisplayLogSuratKeterangan @No_KK_User NUMERIC (16,0) AS
	SELECT No_SuratKeterangan, Nama, Alamat, Tujuan, Keperluan, Keterangan
		FROM ViewLogSuratKeterangan
		WHERE No_KK = @No_KK_User
	GO

EXEC spDisplayLogSuratKeterangan '3578090301085043'


-- FUNCTION 3 : Function untuk mendapatkan Status Tagihan berupa Unpaid atau Paid
CREATE FUNCTION GetStatusTagihan (@NIK NUMERIC(16,0))
RETURNS VARCHAR (50)
AS
BEGIN
    DECLARE @Status VARCHAR (50)
	SELECT TOP 1 
	@Status = StatusPembayaran
		FROM HeaderTagihan, MsUser
		WHERE HeaderTagihan.ID_User = MsUser.ID_User
		and MsUser.NIK = @NIK
		ORDER BY HeaderTagihan.TanggalJatuhTempo DESC
    RETURN(@Status)
END
GO

SELECT dbo.GetStatusTagihan('3578092210060001') --ATAS NAMA GUANA TANDJUNG
SELECT dbo.GetStatusTagihan('3578091509890006') --ATAS NAMA SUDARMONO


-- SPROCEDURE 4 : Procedure untuk mencetak Surat Keterangan
ALTER PROCEDURE spCetakSuratKeterangan @No_SuratKeterangan VARCHAR (6) AS
	SELECT 
	ViewPenduduk.NamaRT,
	ViewPenduduk.NamaRW,
	ViewPenduduk.NamaKelurahan,
	No_SuratKeterangan,
	ViewPenduduk.Nama,
	ViewPenduduk.Alamat,
	ViewPenduduk.Pekerjaan,
	ViewPenduduk.JenisKelamin,
	TTL = ViewPenduduk.TempatLahir + ' / ' + CAST (ViewPenduduk.TanggalLahir AS VARCHAR),
	ViewPenduduk.Agama,
	ViewPenduduk.StatusPerkawinan,
	ViewPenduduk.Kewarganegaraan,
	ViewPenduduk.No_KK,
	ViewPenduduk.NIK,
	Tujuan,
	MsKeperluan.Keperluan,
	SuratKeterangan.Keterangan,
	TempatPengajuan + ', ' + CAST (TanggalPengajuan AS VARCHAR),
	NamaKetuaRT = KetuaRT.Nama,
	NamaKetuaRW = KetuaRW.Nama
		FROM SuratKeterangan, MsUser, ViewPenduduk, MsKeperluan, Penduduk AS KetuaRT, Penduduk AS KetuaRW
		WHERE SuratKeterangan.ID_User = MsUser.ID_User
		and MsUser.NIK = ViewPenduduk.NIK 
		and SuratKeterangan.Keperluan = MsKeperluan.ID_Keperluan
		and ViewPenduduk.NIK_KetuaRT = KetuaRT.NIK
		and ViewPenduduk.NIK_KetuaRW = KetuaRW.NIK
		and FlagRWSetuju = 1 
		and FlagCetakSuket = 0
		and No_SuratKeterangan = @No_SuratKeterangan
	GO

EXEC spCetakSuratKeterangan 'SK0001' --SUDAH AMBIL
EXEC spCetakSuratKeterangan 'SK0002' --SUDAH AMBIL
EXEC spCetakSuratKeterangan 'SK0003' --SUDAH DICETAK => TIDAK DAPAT DI CETAK LAGI
EXEC spCetakSuratKeterangan 'SK0004' --BELUM DICETAK => BISA DI CETAK
EXEC spCetakSuratKeterangan 'SK0005' --BELUM DIBACA RT => BELUM DAPAT DI CETAK