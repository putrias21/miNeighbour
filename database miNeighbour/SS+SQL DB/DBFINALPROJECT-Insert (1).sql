/* ******************************************************************************************************************************
PERANCANGAN	DATABASE KEPENDUDUKAN DI TINGKAT RT/RW
By Julio Rivaldo, Vincentius Sutanto, Putri Aurelia Shilo

Insert Table Database
****************************************************************************************************************************** */

-- INSERT u/ TABLE Penduduk
INSERT INTO Penduduk (NIK, Nama, TempatLahir, TanggalLahir, JenisKelamin, Alamat, Agama, [Status], Pekerjaan, GolonganDarah, StatusKTP, FotoKTP)
	VALUES 
	('3578092401010003', 'Gunaidi Sutanto', 'Surabaya', '2001/01/24', 'L', 'Klampis Indah 3/6 C-2', 'KATOLIK', 'Kawin', 'Pelajar/Mahasiswa', 'A', 'punya', 'ktp1.jpg'),
	('3578092301010001', 'Christine', 'Surabaya', '2001/01/23', 'P', 'Klampis Indah 3/16', 'KRISTEN', 'Belum Kawin', 'Pelajar/Mahasiswa', 'A', 'punya', 'ktp2.jpg'),
	('3578092205990002', 'Novita Gunawan', 'Surabaya', '1999/05/22', 'P', 'Klampis Indah 4/8', 'KATOLIK', 'Belum Kawin', 'Pegawai Swasta', 'O', 'punya', 'ktp3.jpg'),
	('3578090101010006', 'Julio Rivaldo', 'Surabaya', '2001/01/01', 'L', 'Klampis Indah 3/6 C-2', 'KATOLIK', 'Belum Kawin', 'Pelajar/Mahasiswa', 'B', 'punya', 'ktp4.jpg'),
	('3671092305010002', 'Catherine Wijaya', 'Surabaya', '2001/05/23', 'P', 'Klampis Indah 3/6 C-2', 'KRISTEN', 'Kawin', 'Pelajar/Mahasiswa', 'A', 'punya', 'ktp5.jpg'),
	('3578091409800006', 'Suparti', 'Surabaya', '1980/09/14', 'P', 'Klampis Indah 3/3 C-8', 'ISLAM', 'Kawin', 'Pegawai Negeri', 'O', 'punya', 'ktp6.jpg'),
	('3578091509890006', 'Sukarmajo', 'Surabaya', '1989/09/15', 'L', 'Klampis Indah 3/3 C-8', 'ISLAM', 'Kawin', 'Wiraswasta', 'A', 'punya', 'ktp7.jpg'),
	('3578091003040006', 'Bedjo', 'Surabaya', '2004/03/10', 'L', 'Klampis Indah 3/3 C-8', 'ISLAM', 'Belum Kawin', 'Pelajar/Mahasiswa', 'B', 'belum', NULL),
	('3578093543450006', 'Agus Kuyy', 'Surabaya', '1998/07/12', 'L', 'Klampis Indah 4/1', 'ISLAM', 'Belum Kawin', 'Pegawai Negeri', 'AB', 'punya', 'ktp8.jpg'),
	('3578094567650006', 'Suparti hehe', 'Surabaya', '1999/11/28', 'P', 'Klampis Indah 5/6', 'BUDDHA', 'Kawin', 'Pelajar/Mahasiswa', 'A', 'punya', 'ktp9.jpg'),
	('3578091345200006', 'Su Su', 'Surabaya', '1996/06/16', 'P', 'Klampis Indah 12/3', 'HINDU', 'Kawin', 'Pegawai Negeri', 'B', 'punya', 'ktp10.jpg'),
	('3578067869800006', 'Enrico SA', 'Surabaya', '1984/04/18', 'L', 'Klampis Indah 5/1', 'KONGHUCU', 'Cerai Mati', 'Pelajar/Mahasiswa', 'O', 'punya', 'ktp11.jpg'),
	('3578091980800006', 'Agung Her', 'Surabaya', '1988/05/17', 'L', 'Klampis Indah 6/3', 'KRISTEN', 'Cerai Hidup', 'Pegawai Negeri', 'B', 'punya', 'ktp12.jpg'),
	('3578092344440006', 'Dummy1', 'Surabaya', '1999/06/16', 'P', 'Klampis Indah 12/3', 'HINDU', 'Kawin', 'Pegawai Negeri', 'B', 'punya', 'ktp13.jpg'),
	('3578067345340006', 'Dummy2', 'Surabaya', '1954/04/18', 'L', 'Klampis Indah 5/1', 'KONGHUCU', 'Kawin', 'Pelajar/Mahasiswa', 'O', 'punya', 'ktp14.jpg'),
	('3578091564050006', 'Dummy3', 'Surabaya', '1967/05/17', 'L', 'Klampis Indah 6/3', 'KRISTEN', 'Kawin', 'Pegawai Negeri', 'B', 'punya', 'ktp15.jpg'),
	('3578092345675004', 'Dummy4', 'Surabaya', '1999/06/16', 'P', 'Klampis Indah 9/3', 'HINDU', 'Kawin', 'Pegawai Negeri', 'B', 'punya', 'ktp16.jpg'),
	('3578067345670002', 'Dummy5', 'Surabaya', '1954/04/18', 'L', 'Klampis ASRI 5/1', 'KONGHUCU', 'Kawin', 'Pelajar/Mahasiswa', 'O', 'punya', 'ktp17.jpg'),
	('3578091564050001', 'Dummy6', 'Surabaya', '1967/05/17', 'L', 'Klampis ASRI 6/3', 'KRISTEN', 'Kawin', 'Pegawai Negeri', 'B', 'punya', 'ktp18.jpg'),
	('3578092210060001', 'Guana Tandjung', 'Surabaya', '1960/10/22', 'L', 'Klampis Indah 3/43', 'KRISTEN', 'Kawin', 'Pegawai Negeri', 'B', 'punya', 'ktp19.jpg'),
	('3578097110600001', 'Indira Suradja', 'Surabaya', '1960/10/31', 'P', 'Klampis Indah 3/43', 'KRISTEN', 'Kawin', 'Pegawai Negeri', 'B', 'punya', 'ktp20.jpg'),
	('3578092210870003', 'Issac Tandjung', 'Surabaya', '1987/10/22', 'L', 'Klampis Indah 3/43', 'KRISTEN', 'Belum Kawin', 'Pelajar/Mahasiswa', 'O', 'punya', 'ktp21.jpg'),
	('3578090804980004', 'Jeremy Tandjung', 'Surabaya', '1998/04/08', 'L', 'Klampis Indah 3/43', 'KRISTEN', 'Belum Kawin', 'Pelajar/Mahasiswa', 'B', 'punya', 'ktp22.jpg')


-- INSERT u/ TABLE MsProvinsi
INSERT INTO MsProvinsi (ID_Provinsi, NamaProvinsi)
	VALUES 
	('1', 'Nanggroe Aceh Darussalam'),
	('2', 'Sumatera Utara'),
	('3', 'Sumatera Selatan'),
	('4', 'Sumatera Barat'),
	('5', 'Bengkulu'),
	('6', 'Riau'),
	('7', 'Kepulauan Riau'),
	('8', 'Jambi'),
	('9', 'Lampung'),
	('10', 'Bangka Belitung'),
	('11', 'Kalimantan Barat'),
	('12', 'Kalimantan Timur'),
	('13', 'Kalimantan Selatan'),
	('14', 'Kalimantan Tengah'),
	('15', 'Kalimantan Utara'),
	('16', 'Banten'),
	('17', 'DKI Jakarta'),
	('18', 'Jawa Barat'),
	('19', 'Jawa Tengah'),
	('20', 'DI Yogyakarta'),
	('21', 'Jawa Timur'),
	('22', 'Bali'),
	('23', 'Nusa Tenggara Timur'),
	('24', 'Nusa Tenggara Barat'),
	('25', 'Gorontalo'),
	('26', 'Sulawesi Barat'),
	('27', 'Sulawesi Tengah'),
	('28', 'Sulawesi Utara'),
	('29', 'Sulawesi Tenggara'),
	('30', 'Sulawesi Selatan'),
	('31', 'Maluku Utara'),
	('32', 'Maluku'),
	('33', 'Papua Barat'),
	('34', 'Papua')


-- INSERT u/ TABLE MsKabKota
INSERT INTO MsKabKota (ID_KabKota, NamaKabKota, ID_Provinsi)
	VALUES
	('1', 'Kabupaten Bangkalan', '21'),
	('2', 'Kabupaten Banyuwangi', '21'),
	('3', 'Kabupaten Blitar', '21'),
	('4', 'Kabupaten Bojonegoro', '21'),
	('5', 'Kabupaten Bondowoso', '21'),
	('6', 'Kabupaten Gresik', '21'),
	('7', 'Kabupaten Jember', '21'),
	('8', 'Kabupaten Kediri', '21'),
	('9', 'Kabupaten Malang', '21'),
	('10', 'Kabupaten Pasuruan', '21'),
	('11', 'Kabupaten Probolinggo', '21'),
	('12', 'Kabupaten Sidoarjo', '21'),
	('13', 'Kabupaten Situbondo', '21'),
	('14', 'Kota Batu', '21'),
	('15', 'Kota Blitar', '21'),
	('16', 'Kota Kediri', '21'),
	('17', 'Kota Madiun', '21'),
	('18', 'Kota Malang', '21'),
	('19', 'Kota Surabaya', '21'),
	('20', 'Kota Probolinggo', '21'),
	('21', 'Kota Pasuruan', '21'),
	('22', 'Kota Mojokerto', '21'),
	('23', 'Kabupaten Semarang', '19'),
	('24', 'Kota Surakarta', '19'),
	('25', 'Kota Salatiga', '19')


-- INSERT u/ TABLE MsKecamatan
INSERT INTO MsKecamatan (ID_Kecamatan, NamaKecamatan, ID_KabKota)
	VALUES 
	('1', 'Asemrowo', '19'),
	('2', 'Benowo', '19'),
	('3', 'Bubutan', '19'),
	('4', 'Bulak', '19'),
	('5', 'Dukuh Pakis', '19'),
	('6', 'Gayungan', '19'),
	('7', 'Genteng', '19'),
	('8', 'Gubeng', '19'),
	('9', 'Gunung Anyar', '19'),
	('10', 'Jambangan', '19'),
	('11', 'Sukolilo', '19'),
	('12', 'Tegalsari', '19'),
	('13', 'Tenggilis Mejoyo', '19'),
	('14', 'Wiyung', '19'),
	('15', 'Wonokromo', '19')


-- INSERT u/ TABLE MsKelurahan
INSERT INTO MsKelurahan (KodePos, NamaKelurahan, ID_Kecamatan)
	VALUES
	('60111', 'Keputih', '11'),
	('60117', 'Klampis Ngasem', '11'),
	('60118', 'Menur Pumpungan', '11'),
	('60119', 'Semolowaru', '11'),
	('60294', 'Gunung Anyar', '9'),
	('60293', 'Rungkut Menanggal', '9')


-- INSERT u/ TABLE MsRW
INSERT INTO MsRW (ID_RW, NamaRW, Keterangan, NIK_KetuaRW, KodePos)
	VALUES
	('1', 'RW.001', 'Klampis Ngasem Sukolilo', '3578091980800006', '60117'),
	('2', 'RW.002', 'Klampis Ngasem Sukolilo', '3578092344440006', '60117'),
	('3', 'RW.003', 'Klampis Ngasem Sukolilo', '3578067345340006', '60117'),
	('4', 'RW.004', 'Klampis Ngasem Sukolilo', '3578091564050006', '60117')


-- INSERT u/ TABLE MsRT
INSERT INTO MsRT (ID_RT, NamaRT, Keterangan, NIK_KetuaRT, ID_RW)
	VALUES
	('1', 'RT.001', 'Klampis Indah III RW.001', '3578067869800006', '1'),
	('2', 'RT.002', 'Klampis Indah V RW.001', '3578091345200006', '1'),
	('3', 'RT.003', 'Klampis Indah VII RW.001', '3578091564050001', '1'),
	('4', 'RT.004', 'Klampis Indah IX RW.001', '3578092345675004', '1'),
	('5', 'RT.001', 'Klampis Asri I RW.002', '3578091564050001', '2'),
	('6', 'RT.002', 'Klampis Asri II RW.002', '3578067345670002', '2')


-- INSERT u/ TABLE Header_KK
INSERT INTO Header_KK (No_KK, Alamat, NoRumah, BlokRumah, ID_RT, ID_RW, KodePos, ID_Kecamatan, ID_KabKota, ID_Provinsi, TanggalPengeluaran, FotoKK)
	VALUES
	('3578090301085043', 'Klampis Indah 3/43', '43', '3', '1', '1', '60117', '11', '19', '21', '2013/11/08', 'FotoKK1.jpg'),
	('3578090124789043', 'Klampis Indah 3/6', '6', '3', '1', '1', '60117', '11', '19', '21', '2018/7/18', 'FotoKK2.jpg'),
	('3578090808989090', 'Klampis Indah 3/3', '3', '3', '1', '1', '60117', '11', '19', '21', '2010/9/22', 'FotoKK3.jpg')


-- INSERT u/ TABLE Detail_KK
INSERT INTO Detail_KK (No_KK, NIK, StatusHubungan, Kewarganegaraan, No_Paspor, No_KITAS, NamaAyah, NamaIbu)
	VALUES
	('3578090301085043', '3578092210060001', 'Kepala Keluarga', 'WNI', 'B980129', NULL, 'Leo Tandjung', 'Swandajani Tandjung'),
	('3578090301085043', '3578097110600001', 'Istri', 'WNI', 'B888142', NULL, 'Didi Suradja', 'Sarah Setia'),
	('3578090301085043', '3578092210870003', 'Anak', 'WNI', 'B891681', NULL, 'Guana Tandjung', 'Indira Suradja'),
	('3578090301085043', '3578090804980004', 'Anak', 'WNI', NULL, NULL, 'Guana Tandjung', 'Indira Suradja'),
	('3578090124789043', '3578092401010003', 'Kepala Keluarga', 'WNI', 'B456661', NULL, 'Winardi Sutanto', 'Nansi Cahyadi'),
	('3578090124789043', '3671092305010002', 'Istri', 'WNI', NULL, NULL, 'Oei Wijaya', 'Niniek '),
	('3578090124789043', '3578090101010006', 'Keluarga Lain', 'WNI', NULL, NULL, 'Herman Sutanto', 'Tere Lie'),
	('3578090808989090', '3578091509890006', 'Kepala Keluarga', 'WNI', 'B478542', NULL, 'Maridjan', 'Marisa'),
	('3578090808989090', '3578091409800006', 'Istri', 'WNI', 'B312568', NULL, 'Sudarmono', 'Sudarmini '),
	('3578090808989090', '3578091003040006', 'Anak', 'WNI', 'B457568', NULL, 'Sukarajo', 'Suparti')


-- INSERT u/ TABLE MsUser
INSERT INTO MsUser (ID_User, No_KK, NIK, NamaDepan, NamaBelakang, Alamat, No_HP, Email, Username, [Password], TanggalBuatAkun)
	VALUES
	('US0001', '3578090301085043', '3578092210060001', 'Guana', 'Tandjung', 'Klampis Indah 3/43', '081553265707', 'guana@abc.com', 'gundtan', 'gundtan123', '2020/11/09'),
	('US0002', '3578090808989090', '3578091509890006', 'Sudarmono', 'Ahmad', 'Klampis Indah 3/3', '081677800097', 'sudarmono@abc.com', 'darmojoo', 'd4rm0j0', '2020/11/10')


-- INSERT u/ TABLE MsKeperluan
INSERT INTO MsKeperluan (ID_Keperluan, Keperluan, KetKeperluan, KetLampiran)
	VALUES
	('KP0001', 'Akte Kelahiran', 'Pengajuan untuk membuat Akte Kelahiran Baru', 'Surat Lahir RS, KK, Buku Nikah'),
	('KP0002', 'Akte Kematian', 'Surat Pengantar untuk orang mati', 'KTP, KK'),
	('KP0003', 'Buat KTP Usia 17', 'Pengajuan pembuatan KTP karena berumur 17tahun', 'Akte Kelahiran, KK'),
	('KP0004', 'Buat KTP Hilang', 'Pengajuan pembuatan KTP karena hilang', 'KTP lama, KK'),
	('KP0005', 'Surat Pindah Keluar', 'Surat pengantar untuk keluar alamat', 'KTP, KK'),
	('KP0006', 'Surat Pindah Masuk', 'Surat pengantar untuk masuk alamat', 'KTP, KK')


-- INSERT u/ TABLE SuratKeterangan
INSERT INTO SuratKeterangan (No_SuratKeterangan, ID_User, Tujuan, Keperluan, Keterangan, TempatPengajuan, TanggalPengajuan, FlagRTBaca, FlagRTSetuju, FlagRWBaca, FlagRWSetuju, FlagCetakSuket, FlagDapatDiambil, FlagAmbil )
	VALUES
	('SK0001', 'US0001', 'Kelurahan', 'KP0001', 'Untuk anak bernama Hendry Tandjung', 'Surabaya', '2019/01/01', '1', '1', '1', '1', '1', '1', '1'),
	('SK0002', 'US0001', 'Kelurahan', 'KP0004', 'Hilang di luar kota', 'Surabaya', '2019/12/23', '1', '1', '1', '1', '1', '1', '1' ),
	('SK0003', 'US0002', 'Kelurahan', 'KP0002', 'Untuk istri bernama blblbl', 'Surabaya', '2020/06/26', '1', '1', '1', '1', '1', '0', '0'),
	('SK0004', 'US0002', 'Kelurahan', 'KP0005', NULL, 'Surabaya', '2020/08/28', '1', '1', '1', '1', '0', '0', '0' ),
	('SK0005', 'US0001', 'Kelurahan', 'KP0006', NULL, 'Surabaya', '2020/08/29', '0', '0', '0', '0', '0', '0', '0' )


-- INSERT u/ TABLE DetailLampiran
INSERT INTO DetailLampiran (ID_Lampiran, NamaLampiran, FileUpload, StatusUpload, No_SuratKeterangan, StatusVerifikasiRT, TanggalJamVerifikasiRT, StatusVerifikasiRW, TanggalJamVerifikasiRW)
	VALUES
	('LP0001', 'Lampiran KK', 'KK1.jpg', 'Uploaded', 'SK0001', 'Verified', '2019/02/02', 'Verified', '2019/02/02'),
	('LP0002', 'Lampiran Surat Lahir RS', 'Suratlahir1.jpg', 'Uploaded', 'SK0001', 'Verified', '2019/02/02', 'Verified', '2019/02/02'),
	('LP0003', 'Lampiran Buku Nikah', 'Bukunikah1.jpg', 'Uploaded', 'SK0001', 'Verified', '2019/02/02', 'Verified', '2019/02/02'),
	('LP0004', 'Lampiran KTP Lama', 'KTPlama1.jpg', 'Uploaded', 'SK0002', 'Verified', '2019/12/23', 'Verified', '2019/12/24'),
	('LP0005', 'Lampiran KK', 'KK2.jpg', 'Uploaded', 'SK0001', 'Verified', '2019/02/23', 'Verified', '2019/02/24'),
	('LP0006', 'Lampiran KTP', 'Bukunikah1.jpg', 'Uploaded', 'SK0001', 'Verified', '2019/02/02', 'Verified', '2019/02/02'),
	('LP0007', 'Lampiran KK', 'KK3.jpg', 'Uploaded', 'SK0005', 'Unverified', '2019/02/23', 'Unverified', '2019/02/24'),
	('LP0008', 'Lampiran KTP', 'KTP2.jpg', 'Uploaded', 'SK0005', NULL, NULL, NULL, NULL),
	('LP0009', 'Lampiran KTP', 'KTP3.jpg', 'Uploaded', 'SK0003', 'Verified', '2020/06/28', NULL, NULL)


-- INSERT u/ TABLE Pelaporan
INSERT INTO Pelaporan (ID_Pelaporan, ID_Pengguna, Tujuan, Laporan, TanggalLaporan, VerifikasiRT)
	VALUES
	('PP0001', 'US0002', 'RT/RW', 'Meninggalkan Rumah', '2020/12/12', 'Verified'),
	('PP0002', 'US0001', 'RT/RW', 'Sampah tidak diangkut', '2021/01/14', 'Verified')


-- INSERT u/ TABLE JenisTagihan
INSERT INTO JenisTagihan (ID_JenisTagihan, JenisTagihan, Price)
	VALUES
	('JT0001', 'Iuran Kebersihan', '100000'),
	('JT0002', 'Iuran Keamanan', '150000'),
	('JT0003', 'Iuran PKK', '20000'),
	('JT0004', 'Sokongan Pembetulan Jalan', '70000'),
	('JT0005', 'Sokongan Gotong Royong', '100000'),
	('JT0006', 'Sokongan Hari Raya', '50000')


-- INSERT u/ TABLE VirtualAccount
INSERT INTO VirtualAccount (VA_ID, No_KK)
	VALUES
	('30016780453537', '3578090301085043'),
	('30016786784567', '3578090124789043'),
	('30016780235834', '3578090808989090')


-- INSERT u/ TABLE HeaderTagihan
INSERT INTO HeaderTagihan (ID_Tagihan, ID_User, TanggalJatuhTempo, TotalTagihan, StatusPembayaran, TanggalPembayaran, NamaBank, Rekening)
	VALUES
	('TA0001', 'US0001', '2019/01/29', '250000', 'Paid Cash', '2019/01/03', NULL, NULL),
	('TA0002', 'US0002', '2019/01/29', '250000', 'Paid Transfer', '2019/01/16', 'BCA', '520064352321'),
	('TA0003', 'US0001', '2019/02/27', '270000', 'Paid Cash', '2019/02/26', NULL, NULL),
	('TA0004', 'US0002', '2019/02/27', '270000', 'Paid Cash', '2019/02/23', NULL, NULL),
	('TA0005', 'US0001', '2019/03/29', '250000', 'Paid Transfer', '2019/03/04', 'BCA', '720066546544'),
	('TA0006', 'US0002', '2019/03/29', '250000', 'Paid Transfer', '2019/03/08', 'BCA', '520064352321'),
	('TA0007', 'US0001', '2019/04/29', '350000', 'Paid Transfer', '2019/04/06', 'BCA', '720066546544'),
	('TA0008', 'US0002', '2019/04/29', '350000', 'Paid Transfer', '2019/04/05', 'BCA', '520064352321'),
	('TA0009', 'US0001', '2021/01/29', '350000', 'Unpaid', NULL, NULL, NULL),
	('TA0010', 'US0002', '2021/01/29', '350000', 'Paid Transfer', '2021/01/10', 'BCA', '520064352321')

-- INSERT u/ TABLE DetailTagihan
INSERT INTO DetailTagihan (ID_Tagihan, ID_JenisTagihan, SubTotalTagihan)
	VALUES
	('TA0001', 'JT0001', '100000'),
	('TA0001', 'JT0002', '150000'),
	('TA0002', 'JT0001', '100000'),
	('TA0002', 'JT0002', '150000'),
	('TA0003', 'JT0001', '100000'),
	('TA0003', 'JT0002', '150000'),
	('TA0003', 'JT0003', '20000'),
	('TA0004', 'JT0001', '100000'),
	('TA0004', 'JT0002', '150000'),
	('TA0004', 'JT0003', '20000'),
	('TA0005', 'JT0001', '100000'),
	('TA0005', 'JT0002', '150000'),
	('TA0006', 'JT0001', '100000'),
	('TA0006', 'JT0002', '150000'),
	('TA0007', 'JT0001', '100000'),
	('TA0007', 'JT0002', '150000'),
	('TA0007', 'JT0005', '100000')