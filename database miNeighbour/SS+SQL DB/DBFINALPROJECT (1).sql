/* ******************************************************************************************************************************
PERANCANGAN	DATABASE KEPENDUDUKAN DI TINGKAT RT/RW
By Julio Rivaldo, Vincentius Sutanto, Putri Aurelia Shilo

Create Table Database
****************************************************************************************************************************** */

CREATE TABLE Penduduk
(
	NIK NUMERIC (16,0) NOT NULL,
	Nama VARCHAR (50) NOT NULL,
	TempatLahir VARCHAR (15) NOT NULL,
	TanggalLahir DATE NOT NULL,
	JenisKelamin VARCHAR (3) NOT NULL CHECK ( JenisKelamin = 'L' or JenisKelamin = 'P'),
	Alamat VARCHAR (100) NOT NULL,
	Agama VARCHAR (15) NOT NULL CHECK ( Agama = 'ISLAM' or Agama = 'KATOLIK' or Agama = 'KRISTEN' or Agama = 'BUDDHA' or Agama = 'HINDU' or Agama = 'KONGHUCU' ),
	[Status] VARCHAR (20) NOT NULL CHECK ( [Status] = 'Kawin' or [Status] = 'Belum Kawin' or [Status] = 'Cerai Mati' or [Status] = 'Cerai Hidup'),
	Pekerjaan VARCHAR (25),
	GolonganDarah VARCHAR (4) NOT NULL,
	StatusKTP VARCHAR (10) CHECK ( StatusKTP like 'punya' or StatusKTP like 'belum' ),
	FotoKTP VARCHAR (50),
 	
	PRIMARY KEY (NIK)
)

CREATE TABLE MsProvinsi
(
	ID_Provinsi NUMERIC (5,0) NOT NULL,
	NamaProvinsi VARCHAR (25) NOT NULL,

	PRIMARY KEY (ID_Provinsi)
)

CREATE TABLE MsKabKota
(
	ID_KabKota NUMERIC (5,0) NOT NULL,
	NamaKabKota VARCHAR (25) NOT NULL,
	ID_Provinsi NUMERIC (5,0) NOT NULL,

	PRIMARY KEY (ID_KabKota),
	FOREIGN KEY (ID_Provinsi) REFERENCES MsProvinsi (ID_Provinsi) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE MsKecamatan 
(
	ID_Kecamatan NUMERIC (5,0) NOT NULL,
	NamaKecamatan VARCHAR (25) NOT NULL,
	ID_KabKota NUMERIC (5,0) NOT NULL,

	PRIMARY KEY (ID_Kecamatan),
	FOREIGN KEY (ID_KabKota) REFERENCES MsKabKota (ID_KabKota) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE MsKelurahan
(
	KodePos NUMERIC (10,0) NOT NULL,
	NamaKelurahan VARCHAR (20) NOT NULL,
	ID_Kecamatan NUMERIC (5,0) NOT NULL,

	PRIMARY KEY (KodePos),
	FOREIGN KEY (ID_Kecamatan) REFERENCES MsKecamatan (ID_Kecamatan) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE MsRW
(
	ID_RW NUMERIC (10,0) NOT NULL,
	NamaRW VARCHAR (50) NOT NULL,
	Keterangan VARCHAR (100),
	NIK_KetuaRW NUMERIC (16,0) NOT NULL,
	KodePos NUMERIC (10,0) NOT NULL,

	PRIMARY KEY (ID_RW),
	FOREIGN KEY (NIK_KetuaRW) REFERENCES Penduduk (NIK) ON UPDATE NO ACTION,
	FOREIGN KEY (KodePos) REFERENCES MsKelurahan (KodePos) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE MsRT 
(
	ID_RT NUMERIC (10,0) NOT NULL,
	NamaRT VARCHAR (50) NOT NULL,
	Keterangan VARCHAR (100),
	NIK_KetuaRT NUMERIC (16,0) NOT NULL,
	ID_RW NUMERIC (10,0) NOT NULL,

	PRIMARY KEY (ID_RT),
	FOREIGN KEY (NIK_KetuaRT) REFERENCES Penduduk (NIK) ON UPDATE NO ACTION,
	FOREIGN KEY (ID_RW) REFERENCES MsRW (ID_RW) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Header_KK
(
	No_KK NUMERIC (16,0) NOT NULL,
	Alamat VARCHAR (100) NOT NULL,
	NoRumah NUMERIC (3,0) NOT NULL,
	BlokRumah VARCHAR (5) NOT NULL,
	ID_RT NUMERIC (10,0) NOT NULL,
	ID_RW NUMERIC (10,0) NOT NULL,
	KodePos NUMERIC (10,0) NOT NULL,
	ID_Kecamatan NUMERIC (5,0) NOT NULL,
	ID_KabKota NUMERIC (5,0) NOT NULL,
	ID_Provinsi NUMERIC (5,0) NOT NULL,
	TanggalPengeluaran DATE NOT NULL,
	FotoKK VARCHAR (50),

	PRIMARY KEY (No_KK),
	FOREIGN KEY (ID_RT) REFERENCES MsRT (ID_RT) ON UPDATE NO ACTION,
	FOREIGN KEY (ID_RW) REFERENCES MsRW (ID_RW) ON UPDATE NO ACTION,
	FOREIGN KEY (KodePos) REFERENCES MsKelurahan (KodePos) ON UPDATE NO ACTION,
	FOREIGN KEY (ID_Kecamatan) REFERENCES MsKecamatan (ID_Kecamatan) ON UPDATE NO ACTION,
	FOREIGN KEY (ID_KabKota) REFERENCES MsKabKota (ID_KabKota) ON UPDATE NO ACTION,
	FOREIGN KEY (ID_Provinsi) REFERENCES MsProvinsi (ID_Provinsi) ON UPDATE NO ACTION
)

CREATE TABLE Detail_KK
(
	No_KK NUMERIC (16,0) NOT NULL,
	NIK NUMERIC (16,0) NOT NULL,
	StatusHubungan VARCHAR (50) NOT NULL,
	Kewarganegaraan VARCHAR (10) NOT NULL,
	No_Paspor CHAR (8),
	No_KITAS CHAR (11),
	NamaAyah VARCHAR (25) NOT NULL,
	NamaIbu VARCHAR (25) NOT NULL,
	
	PRIMARY KEY (No_KK, NIK),
	FOREIGN KEY (No_KK) REFERENCES Header_KK (No_KK) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (NIK) REFERENCES Penduduk (NIK) ON UPDATE NO ACTION
)

CREATE TABLE MsUser
(
	ID_User CHAR (6) NOT NULL CHECK (ID_User like 'US[0-9][0-9][0-9][0-9]' ),
	No_KK NUMERIC (16,0) NOT NULL,
	NIK NUMERIC (16,0) NOT NULL,
	NamaDepan VARCHAR (25) NOT NULL,
	NamaBelakang VARCHAR (25),
	Alamat VARCHAR (100) NOT NULL,
	No_Hp VARCHAR (13) NOT NULL,
	Email VARCHAR (50) NOT NULL,
	Username VARCHAR (12) NOT NULL,
	[Password] VARCHAR (10) NOT NULL,
	TanggalBuatAkun DATE NOT NULL,

	PRIMARY KEY (ID_User), 
	FOREIGN KEY (No_KK) REFERENCES Header_KK (No_KK) ON UPDATE NO ACTION,
	FOREIGN KEY (NIK) REFERENCES Penduduk (NIK) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE MsKeperluan
(
	ID_Keperluan CHAR (6) NOT NULL CHECK ( ID_Keperluan like 'KP[0-9][0-9][0-9][0-9]'),
	Keperluan VARCHAR (35) NOT NULL,
	KetKeperluan VARCHAR (100),
	KetLampiran VARCHAR (200),

	PRIMARY KEY (ID_Keperluan)
)

CREATE TABLE SuratKeterangan
(
	No_SuratKeterangan CHAR (6) NOT NULL CHECK (No_SuratKeterangan like 'SK[0-9][0-9][0-9][0-9]'),
	ID_User CHAR (6) NOT NULL,
	Tujuan VARCHAR (25) NOT NULL, 
	Keperluan CHAR (6) NOT NULL,
	Keterangan VARCHAR (150),
	TempatPengajuan VARCHAR (15),
	TanggalPengajuan DATE NOT NULL,
	FlagRTBaca TINYINT,
	FlagRTSetuju TINYINT,
	FlagRWBaca TINYINT,
	FlagRWSetuju TINYINT,
	FlagCetakSuket TINYINT,
	FlagDapatDiambil TINYINT,
	FlagAmbil TINYINT,

	PRIMARY KEY (No_SuratKeterangan),
	FOREIGN KEY (ID_User) REFERENCES MsUser (ID_User) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Keperluan) REFERENCES MsKeperluan (ID_Keperluan) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE DetailLampiran
(
	ID_Lampiran CHAR (6) NOT NULL CHECK (ID_Lampiran like 'LP[0-9][0-9][0-9][0-9]'),
	NamaLampiran VARCHAR (30) NOT NULL,
	FileUpload VARCHAR (100) NOT NULL,
	StatusUpload VARCHAR (20) NOT NULL,
	No_SuratKeterangan CHAR (6) NOT NULL,
	StatusVerifikasiRT VARCHAR (20),
	TanggalJamVerifikasiRT DATE,
	StatusVerifikasiRW VARCHAR (20),
	TanggalJamVerifikasiRW DATE,

	PRIMARY KEY (ID_Lampiran),
	FOREIGN KEY (No_SuratKeterangan) REFERENCES SuratKeterangan (No_SuratKeterangan) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Pelaporan
(
	ID_Pelaporan CHAR (6) NOT NULL CHECK ( ID_Pelaporan like 'PP[0-9][0-9][0-9][0-9]' ),
	ID_Pengguna CHAR (6) NOT NULL,
	Tujuan VARCHAR (25),
	Laporan VARCHAR (100) NOT NULL,
	TanggalLaporan DATE NOT NULL,
	VerifikasiRT VARCHAR (20),
	
	PRIMARY KEY (ID_Pelaporan),
	FOREIGN KEY (ID_Pengguna) REFERENCES MsUser (ID_User) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE JenisTagihan
(
	ID_JenisTagihan CHAR (6) NOT NULL CHECK (ID_JenisTagihan like 'JT[0-9][0-9][0-9][0-9]'),
	JenisTagihan VARCHAR (50) NOT NULL,
	Price INT NOT NULL, 

	PRIMARY KEY (ID_JenisTagihan)
)

CREATE TABLE VirtualAccount
(
	VA_ID NUMERIC (14,0) NOT NULL CHECK ( VA_ID like '3001[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
	No_KK NUMERIC (16,0) NOT NULL,

	PRIMARY KEY (VA_ID),
	FOREIGN KEY (No_KK) REFERENCES Header_KK (No_KK) ON UPDATE CASCADE ON DELETE CASCADE,
)

CREATE TABLE HeaderTagihan
(
	ID_Tagihan CHAR (6) NOT NULL CHECK ( ID_Tagihan like 'TA[0-9][0-9][0-9][0-9]' ),
	ID_User CHAR (6) NOT NULL,
	TanggalJatuhTempo DATE NOT NULL,
	TotalTagihan INT,
	StatusPembayaran VARCHAR (50) NOT NULL CHECK ( StatusPembayaran = 'Unpaid' or StatusPembayaran = 'Paid Cash' or StatusPembayaran = 'Paid Transfer'),
	TanggalPembayaran DATE,
	NamaBank VARCHAR (20),
	Rekening VARCHAR (20)

	PRIMARY KEY (ID_Tagihan),
	FOREIGN KEY (ID_User) REFERENCES MsUser (ID_User) ON UPDATE CASCADE ON DELETE CASCADE,
)	

CREATE TABLE DetailTagihan
(
	ID_Tagihan CHAR (6) NOT NULL,
	ID_JenisTagihan CHAR (6) NOT NULL,
	SubTotalTagihan INT NOT NULL,

	PRIMARY KEY (ID_Tagihan, ID_JenisTagihan),
	FOREIGN KEY (ID_Tagihan) REFERENCES HeaderTagihan (ID_Tagihan) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (ID_JenisTagihan) REFERENCES JenisTagihan (ID_JenisTagihan) ON UPDATE CASCADE ON DELETE CASCADE
)
