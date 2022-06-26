USE [master];
GO

DROP DATABASE MotelDB
GO

CREATE DATABASE MotelDB
GO

USE MotelDB
GO

CREATE TABLE [tblUser](--done
[UserID]       [varchar](10) not null PRIMARY KEY,
[FullName]     [nvarchar](100) not null,
[Image]        [nvarchar](255),
[DateOfBirth]  [date],
[CitizenNumber][varchar](12),
[Gender]		[bit] null,
[Address]		[nvarchar](200),
[Phone]        [varchar](12),
[Gmail]        [varchar](50),
[Password]     [varchar](20),
[Role]         [nvarchar](10),
[Status]       int,
);

CREATE TABLE [tblCity](--done
[CityID]      [varchar](10) not null PRIMARY KEY,
[Name]         [nvarchar](50)
);
CREATE TABLE [tblDistrict](--done
[DistrictID]      [varchar](10) not null PRIMARY KEY,
[Name]         [nvarchar](50),
[CityID]      [varchar](10) not null FOREIGN KEY REFERENCES tblCity(CityID),
);


INSERT [tblCity] ([CityID], [Name]) VALUES (N'1', N'TP Hồ Chí Minh')

/*disctrictID sẽ là số của cityID + 1 2 3 tăng dần*/
INSERT [tblDistrict] ([DistrictID], [Name],[CityID]) VALUES (N'1', N'Bình Tân', '1')
INSERT [tblDistrict] ([DistrictID],  [Name],[CityID]) VALUES (N'2', N'Gò Vấp', '1')
INSERT [tblDistrict] ([DistrictID], [Name],[CityID]) VALUES (N'3', N'Tân Bình', '1')
INSERT [tblDistrict] ([DistrictID],  [Name],[CityID]) VALUES (N'4', N'Quận 1', '1')
INSERT [tblDistrict] ([DistrictID], [Name],[CityID]) VALUES (N'5', N'Quận 3', '1')
INSERT [tblDistrict] ([DistrictID],  [Name],[CityID]) VALUES (N'6', N'Quận 6', '1')
INSERT [tblDistrict] ([DistrictID], [Name],[CityID]) VALUES (N'7', N'Thành phố Thủ Đức', '1')
INSERT [tblDistrict] ([DistrictID],  [Name],[CityID]) VALUES (N'8', N'Quận 7', '1')
INSERT [tblDistrict] ([DistrictID], [Name],[CityID]) VALUES (N'9', N'Quận 8', '1')
INSERT [tblDistrict] ([DistrictID],  [Name],[CityID]) VALUES (N'10', N'Quận Bình Thạnh', '1')
INSERT [tblDistrict] ([DistrictID], [Name],[CityID]) VALUES (N'11', N'Quận Phú Nhuận', '1')
INSERT [tblDistrict] ([DistrictID],  [Name],[CityID]) VALUES (N'12', N'Quận 6', '1')


CREATE TABLE [tblMotel](--done
[MotelID]      [varchar](10) not null PRIMARY KEY,
[Name]         [nvarchar](50),
[Phone]        [varchar](10),
[Desct]        [nvarchar] (MAX),
[Image]        [nvarchar](1000),
[Address]      [nvarchar](200), /* này sẽ nhập số nhà tên đường và phường nhé*/
[DistrictID]	[varchar](10) not null FOREIGN KEY REFERENCES tblDistrict(DistrictID),
[Ratings]      [decimal](2,1)
CONSTRAINT chk_Ratings CHECK (Ratings >= 0 AND Ratings <= 5),
[OwnerID]      [varchar](10) not null FOREIGN KEY REFERENCES tblUser(UserID),
[Status]       int 
);



CREATE TABLE [tblService](--done
[ServiceID]    [varchar](10) Not Null PRIMARY KEY ,
[ServiceName]  [nvarchar](50),
[Price]        [decimal](10) Not Null ,
[Status]       int ,
[MotelID]      [varchar](10) Not Null FOREIGN KEY REFERENCES tblMotel(MotelID),
);

CREATE TABLE [tblRoomType](
[RoomTypeID]	[varchar](10) not null PRIMARY KEY,
[TypeName]		[nvarchar](50),
[Price]			[decimal](10),
[Image]        [nvarchar](1000),
[Desct]        [nvarchar](1500),
[MotelID]      [varchar](10) Not Null FOREIGN KEY REFERENCES tblMotel(MotelID),
[Status]       int ,
);

CREATE TABLE [tblRoom](--done
[RoomID]	   [varchar](10) not null PRIMARY KEY,
[Name]         [nvarchar](50) ,
[Status]       int ,
[RoomTypeID]      [varchar](10) not null FOREIGN KEY REFERENCES tblRoomType(RoomTypeID) 
);

CREATE TABLE [tblNotification]( --done
[AnnouncementID]  [varchar](10) not null PRIMARY KEY,
[Title]           [nvarchar](100),
[Desct]           [nvarchar](1500),
[Date]            [date],
[UserID]          [varchar](10) not null FOREIGN KEY REFERENCES tblUser(UserID),
);

CREATE TABLE [tblBooking](--done
[BookingID]       [varchar](10) not null PRIMARY KEY,
[BookingDate]     [date],
[Desct]           [nvarchar](1500),
[Total]           [decimal](10),
[Status]          int ,
[UserID]          [varchar](10) not null FOREIGN KEY REFERENCES tblUser(UserID),  
);
CREATE TABLE [tblBookingDetail](--done
[BookingDetailID] [varchar](10) not null PRIMARY KEY,
[RoomID]          [varchar](10) not null FOREIGN KEY REFERENCES tblRoom(RoomID),
[BookingID]       [varchar](10) not null FOREIGN KEY REFERENCES tblBooking(BookingID),
[Time]			[int],
);

CREATE TABLE [tblPayment](
[PaymentID]       [varchar](10) UNIQUE not Null,
[Desct]           [nvarchar](1500),
[PaymentTime]     [date],
[Sender]          [nvarchar](50),
[Receiver]        [nvarchar](50),
[PaymentTypeName] [nvarchar](50)
);

CREATE TABLE [tblFeedBack](
[FeedbackID]      [varchar](10) not null PRIMARY KEY,
[Desct]           [nvarchar](1500),
[Ratings]         [decimal](2,1),
[MotelID]         [varchar](10) not null FOREIGN KEY REFERENCES tblMotel(MotelID), 
[BookingID]       [varchar](10) not null FOREIGN KEY REFERENCES tblBooking(BookingID),
[Status]          int ,
);

CREATE TABLE [tblReport](
[ReportID]        [varchar](10) PRIMARY KEY,
[UserID]          [varchar](10) not null FOREIGN KEY REFERENCES tblUser(UserID),
[Title]           [nvarchar](100),
[Desct]           [nvarchar](1500),
[Date]            [date],
[Status]          int ,
[MotelID]         [varchar](10) not null FOREIGN KEY REFERENCES tblMotel(MotelID), 
);

CREATE TABLE [tblBookingServiceDetail](
[BookingSeviceDetailID]     [varchar](10) not null PRIMARY KEY,
[ServiceID]                 [varchar](10) not null FOREIGN KEY REFERENCES tblService(ServiceID),
[BookingID]                 [varchar](10) not null FOREIGN KEY REFERENCES tblBooking(BookingID),
[Quantity]					[int],
[Total]                     [decimal](10),
);

ALTER TABLE [tblPayment]
ADD CONSTRAINT FK_Payment_Booking FOREIGN KEY([PaymentID]) 
    REFERENCES [tblBooking]([BookingID]);


CREATE TABLE [visit_tracking](--done
[id]       [varchar](20) not null PRIMARY KEY,
[time]     int ,
[ip]        [nvarchar](255),
[date]  [date]
);

INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('1', 1655978934,'81.209.177.145','2022-06-23') 
INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('2', 1655978943, '81.209.177.145','2022-06-23') 
INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('3', 1655978953,'40.77.167.62','2022-06-23') 
INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('4', 1655978963,'205.210.31.150','2022-06-23') 

INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('6', 1656176340,'103.131.71.144','2022-06-26') 
INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('7', 1656176785,'114.119.132.161','2022-06-26') 
INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('8', 1656178150,'66.249.66.86','2022-06-26') 
INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('9', 1656178897,'207.46.13.197','2022-06-26') 

INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('10', 1656153799,'114.119.132.18','2022-06-25') 
INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('11', 1656153809, '114.119.132.161','2022-06-25') 
INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('12', 1656153819,'103.131.71.238','2022-06-25') 
INSERT [visit_tracking] ([id], [time],[ip], [date]) VALUES ('13', 1656154240,'66.249.71.216','2022-06-25') 
--/////////////
--insert user UPDATE tblUser set Image = 'assets/img/avatar.jpg' where Status = 0

INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address], [Phone] ,[Gmail], [Role], [Status] ) VALUES (N'quan01', N'Le Minh Quan',N'1', N'images/man.png','2001-05-07',321615057,1,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','0942949219','hoangquan9851@gmail.com','OW',1) 
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber],[Gender], [Address] ,[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'tu06', N'Nguyen Doan Tu',N'1', N'images/man.png','2001-05-26',78523465,1,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','01945876325','tutu988@gmail.com','OW',0) 
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'phuc08', N'Lam Son Phuc',N'1', N'assets/img/avatar.jpg','2001-02-14',235478154,1,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','01478523654','phucson223@gmail.com','OW',1)
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'Quang09', N'Do Duy Quang',N'1', N'images/man.png','1998-05-14',25479864,1,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','0365258417','quang744@gmail.com','OW',1)  
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'chuongmai', N'Huy Chuong',N'99', N'assets/img/avatar.jpg','2002-01-14',214536587,1,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','0975841354','chuongmai@gmail.com','OW',0)
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'nhatvuong', N'Pham Nhat Vuong',N'99', N'images/man.png','1989-01-14',248762544,1,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','0248998745','vuong@gmail.com','OW',1)  
 
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'doan07', N'Nguyen Huu Doan',N'1', N'images/man.png','2001-09-17',712465325,0,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','0965852413','donatran1113@gmail.com','US',1) 
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'hai03', N'Tran Ngoc Hai',N'1', N'images/man.png','2001-10-15',3541258746,1,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','0347895634','haitn@gmail.com','US',1)
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'tuan04', N'Nguyen Huu Pham Tuan',N'1', N'images/man.png','2001-07-07',47853265,1,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','01653992966','tuanhp@gmail.com','US',1)
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'duy05', N'Ho Khanh Duy',N'1', N'images/duy.png','2001-01-25',452874365,0,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','0963756841','Devilgamer@gmail.com','US',0) 
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'Lamm44', N'Dang Son Lam',N'14', N'images/man.png','1989-05-07',58213647,1,N'111 đình phong phú,tăng nhơn phú B,TP thủ đức,hcm','014752368','liontee@gmail.com','US',1)
INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'taich74', N'Nguyen Huu Tai',N'8751', N'images/man.png','1999-11-24',7468512,1,N'Số 71 đường c18 P12 Tân Bình, HCM','0942741653','monster11@gmail.com','US',1) 

INSERT [tblUser] ([UserID], [FullName],[Password], [Image],[DateOfBirth], [CitizenNumber] ,[Gender], [Address],[Phone] ,[Gmail], [Role], [Status] ) VALUES (N'thuy02', N'Cao Thi Phuong Thuy',N'1', N'images/girl.png','2001-04-08',45217896,1,N'166/46d2 Thích Quảng Đức, Phú Nhuận , HCM','0852135789','thuy01@gmail.com','AD',1)  


--insert motel
INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address], [Ratings], [OwnerID], [Status]) VALUES (N'587416594',N'Nhà Trọ Ngọc Quân', N'<p>Nằm c&aacute;ch C&ocirc;ng vi&ecirc;n Yersin 1,2 km, Nh&agrave; Trọ Vạn Ph&uacute;c c&oacute; chỗ nghỉ với sảnh kh&aacute;ch chung, khu vườn v&agrave; lễ t&acirc;n 24 giờ để tạo thuận tiện cho kh&aacute;ch. Chỗ nghỉ n&agrave;y cung cấp WiFi miễn ph&iacute;.</p>

<p>Mỗi căn tại đ&acirc;y đều được bố tr&iacute; ph&ograve;ng tắm ri&ecirc;ng với v&ograve;i xịt/chậu rửa vệ sinh, dép đi trong phòng, m&aacute;y sấy t&oacute;c v&agrave; đồ vệ sinh c&aacute; nh&acirc;n miễn ph&iacute;.</p>

<p>Kh&aacute;ch sạn căn hộ n&agrave;y phục vụ bữa s&aacute;ng &agrave; la carte.</p>

<p>Nh&agrave; Trọ Vạn Ph&uacute;c c&oacute; s&acirc;n hi&ecirc;n.</p>

<p>Du kh&aacute;ch c&oacute; thể đi xe đạp để kh&aacute;m ph&aacute; khu vực xung quanh v&agrave; chỗ nghỉ c&oacute; thể thu xếp dịch vụ cho thu&ecirc; xe hơi.</p>

<p>C&aacute;c điểm tham quan nổi tiếng gần Trọng Nguyễn villa bao gồm Hồ Xu&acirc;n Hương, Quảng trường L&acirc;m Vi&ecirc;n v&agrave; Vườn hoa Đ&agrave; Lạt. S&acirc;n bay gần nhất l&agrave; s&acirc;n bay Li&ecirc;n Khương, nằm trong b&aacute;n k&iacute;nh 23 km từ kh&aacute;ch sạn căn hộ n&agrave;y, v&agrave; chỗ nghỉ cung cấp dịch vụ đưa đ&oacute;n s&acirc;n bay với một khoản phụ ph&iacute;.</p>

<p>&nbsp;</p>
',N'images/motel-1.jpg', N'0948484848','1', N'111 đình phong phú,tăng nhơn phú B',4,N'quan01',1)
INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address], [Ratings], [OwnerID], [Status]) VALUES (N'842578129',N'Nhà Trọ Ánh Dương',N'<p>C&oacute; vị tr&iacute; thuận tiện ở Quận 1, Ngan Ha Hotel cung cấp c&aacute;c ph&ograve;ng nghỉ trang nh&atilde; v&agrave; thoải m&aacute;i với Wi-Fi miễn ph&iacute; tại c&aacute;c khu vực chung. Nơi nghỉ n&agrave;y c&oacute; lễ t&acirc;n 24 giờ v&agrave; chỗ đỗ xe m&aacute;y miễn ph&iacute;.</p>

<p>Kh&aacute;ch sạn c&aacute;ch Chợ Bến Th&agrave;nh nổi tiếng chỉ 200 m v&agrave; Bảo t&agrave;ng Mỹ thuật 400 m. Dinh Độc Lập v&agrave; S&acirc;n bay Quốc tế T&acirc;n Sơn Nhất c&aacute;ch đ&oacute; lần lượt 500 m v&agrave; 7 km l&aacute;i xe.</p>

<p>C&aacute;c ph&ograve;ng m&aacute;y lạnh được b&agrave;i tr&iacute; đơn giản tại đ&acirc;y c&oacute; tủ quần &aacute;o, khu vực tiếp kh&aacute;ch, minibar v&agrave; truyền h&igrave;nh c&aacute;p. Ngo&agrave;i ra c&ograve;n bao gồm ph&ograve;ng tắm ri&ecirc;ng với bồn tắm/tiện nghi v&ograve;i sen. Đồ vệ sinh c&aacute; nh&acirc;n được cung cấp miễn ph&iacute;.</p>

<p>Nh&acirc;n vi&ecirc;n th&acirc;n thiện tại Ngan Ha Hotel sẵn l&ograve;ng hỗ trợ qu&yacute; kh&aacute;ch với c&aacute;c dịch vụ để h&agrave;nh l&yacute;, đặt v&eacute; v&agrave; fax/photocopy. Dịch vụ đưa đ&oacute;n v&agrave; vận chuyển s&acirc;n bay c&oacute; thể được bố tr&iacute; với một khoản phụ ph&iacute;.</p>

<p>Nh&agrave; h&agrave;ng nh&igrave;n ra th&agrave;nh phố tr&ecirc;n tầng 9 của kh&aacute;ch sạn phục vụ nhiều m&oacute;n ăn ngon của Việt Nam v&agrave; phương T&acirc;y.</p>

<p>Đ&acirc;y l&agrave; khu vực ở TP. H&ocirc;̀ Chí Minh m&agrave; kh&aacute;ch y&ecirc;u th&iacute;ch, theo c&aacute;c đ&aacute;nh gi&aacute; độc lập.</p>

<p>C&aacute;c cặp đ&ocirc;i đặc biệt th&iacute;ch địa điểm n&agrave;y &mdash; họ cho điểm&nbsp;<strong>9,6</strong>&nbsp;cho kỳ nghỉ d&agrave;nh cho 2 người.</p>

<p><img alt="" src="images/motel-6.jpg" /></p>
',N'images/motel-5.jpg', N'0328787878','2', N'143A Mỹ Đức,Bình Phú',4.5,N'quan01',1)
INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address], [Ratings], [OwnerID], [Status]) VALUES (N'486258478',N'Nhà Trọ Gia Lai',N'<p>Tọa lạc tại vị tr&iacute; l&yacute; tưởng ở Quận 1 thuộc Th&agrave;nh phố Hồ Ch&iacute; Minh, Saigon Hanoi Central Hotel nằm c&aacute;ch Chợ ẩm thực đường phố Bến Th&agrave;nh 500 m, C&ocirc;ng vi&ecirc;n Tao Đ&agrave;n 500 m v&agrave; Bảo t&agrave;ng Th&agrave;nh phố Hồ Ch&iacute; Minh 800 m. Chỗ nghỉ n&agrave;y c&ograve;n c&oacute; một số tiện nghi như nh&agrave; h&agrave;ng, lễ t&acirc;n 24 giờ, dịch vụ ph&ograve;ng cũng như WiFi miễn ph&iacute; trong to&agrave;n bộ khu&ocirc;n vi&ecirc;n. Kh&aacute;ch sạn cung cấp c&aacute;c ph&ograve;ng gia đ&igrave;nh.</p>

<p>Tất cả ph&ograve;ng nghỉ tại kh&aacute;ch sạn c&oacute; m&aacute;y điều h&ograve;a, TV truyền h&igrave;nh vệ tinh m&agrave;n h&igrave;nh phẳng, tủ lạnh, ấm đun nước, vòi sen, dép v&agrave; tủ để quần &aacute;o. C&aacute;c ph&ograve;ng c&oacute; ph&ograve;ng tắm ri&ecirc;ng, m&aacute;y sấy t&oacute;c v&agrave; ga trải giường.</p>

<p>Kh&aacute;ch sạn cung cấp bữa s&aacute;ng buffet hoặc bữa s&aacute;ng kiểu Mỹ.</p>

<p>C&aacute;c điểm tham quan nổi tiếng gần Saigon Hanoi Central Hotel bao gồm Chợ Bến Th&agrave;nh, trung t&acirc;m thương mại Takashimaya Việt Nam v&agrave; Trung t&acirc;m Thương mại Union Square. S&acirc;n bay gần nhất l&agrave; s&acirc;n bay quốc tế T&acirc;n Sơn Nhất, c&aacute;ch đ&oacute; 12 km, v&agrave; chỗ nghỉ cung cấp dịch vụ đưa đ&oacute;n s&acirc;n bay với một khoản phụ ph&iacute;.</p>

<p>Đ&acirc;y l&agrave; khu vực ở TP. H&ocirc;̀ Chí Minh m&agrave; kh&aacute;ch y&ecirc;u th&iacute;ch, theo c&aacute;c đ&aacute;nh gi&aacute; độc lập.</p>

<p>C&aacute;c cặp đ&ocirc;i đặc biệt th&iacute;ch địa điểm n&agrave;y &mdash; họ cho điểm&nbsp;<strong>8,8</strong>&nbsp;cho kỳ nghỉ d&agrave;nh cho 2 người.</p>
',N'images/motel-4.jpg', N'0248996587','3', N'345/55 Trần Hưng Đạo, Cầu Kho',4.1,N'tu06',1)
INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address], [Ratings], [OwnerID], [Status]) VALUES (N'861435762',N'Nhà Trọ Malibu Beach',N'Desction motel',N'images/motel-7.jpg', N'0344989898','4', N'263, Lê Hồng Phong',4.1,N'chuongmai',1)
INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address], [Ratings], [OwnerID], [Status]) VALUES (N'548762589',N'Nhà Trọ Ladalat',N'<p><strong>Nh&agrave; Trọ Ladala</strong>t tọa lạc ở th&agrave;nh phố Đ&agrave; Lạt, c&aacute;ch Vườn hoa Đ&agrave; Lạt 3,2 km v&agrave; Quảng trường L&acirc;m Vi&ecirc;n 3,4 km. Chỗ nghỉ n&agrave;y nằm trong b&aacute;n k&iacute;nh 3,6 km từ Hồ Xu&acirc;n Hương, 3,7 km từ C&ocirc;ng vi&ecirc;n Yersin v&agrave; 7 km từ Thiền viện Tr&uacute;c L&acirc;m. Chỗ nghỉ cung cấp miễn ph&iacute; WiFi v&agrave; dịch vụ ph&ograve;ng.</p>

<p>Ph&ograve;ng nghỉ tại khách sạn được trang bị b&agrave;n l&agrave;m việc, TV m&agrave;n h&igrave;nh phẳng, ph&ograve;ng tắm ri&ecirc;ng, ga trải giường, khăn tắm v&agrave; ấm đun nước. Ivy Hotel Dalat cung cấp một số ph&ograve;ng c&oacute; tầm nh&igrave;n ra quang cảnh th&agrave;nh phố.</p>

<p>Hồ Tuyền L&acirc;m nằm c&aacute;ch chỗ nghỉ 7 km trong khi N&uacute;i Lang Bian c&aacute;ch đ&oacute; 8 km. S&acirc;n bay gần nhất l&agrave; s&acirc;n bay Li&ecirc;n Khương, nằm trong b&aacute;n k&iacute;nh 31 km từ Ivy Hotel Dalat.</p>

<p>C&aacute;c cặp đ&ocirc;i đặc biệt th&iacute;ch địa điểm n&agrave;y &mdash; họ cho điểm&nbsp;<strong>8,0</strong>&nbsp;cho kỳ nghỉ d&agrave;nh cho 2 người.</p>
',N'images/motel-6.jpg', N'0147586325','5', N'263, Số 19, đường Hoa Hồng, hồ Tuyền Lâm, phường 4',3.9,N'phuc08',1)
INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address], [Ratings], [OwnerID], [Status]) VALUES (N'473658715',N'Nhà Trọ Vạn Phúc',N'Desction motel',N'images/motel-5.jpg', N'0478523645','6', N'91 Vạn Phúc, phường Liễu Giai',4.7,N'Quang09',1)
INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address], [Ratings], [OwnerID], [Status]) VALUES (N'785146827',N'Nhà Trọ VinHome',N'<p>Tọa lạc tại vị tr&iacute; trung t&acirc;m ở Quận 1 của Th&agrave;nh phố Hồ Ch&iacute; Minh, kh&aacute;ch sạn cung cấp c&aacute;c ph&ograve;ng được trang bị nội thất giản dị với Wi-Fi miễn ph&iacute;. Nằm c&aacute;ch Chợ Bến Th&agrave;nh 5 ph&uacute;t đi bộ, nơi đ&acirc;y c&oacute; nh&agrave; h&agrave;ng phục vụ c&aacute;c m&oacute;n ăn Việt Nam.</p>

<p><strong>Nh&agrave; Trọ NgocLan </strong>Nguyễn C&ocirc;ng Trứ The Bitexco Neighbour nằm trong b&aacute;n k&iacute;nh 30 ph&uacute;t l&aacute;i xe từ S&acirc;n bay Quốc tế T&acirc;n Sơn Nhất v&agrave; 700 m từ c&aacute;c điểm tham quan như Dinh Độc Lập cũng như Nh&agrave; thờ Đức B&agrave;.</p>

<p>C&aacute;c ph&ograve;ng m&aacute;y lạnh tại đ&acirc;y c&oacute; s&agrave;n l&aacute;t gạch v&agrave; ph&ograve;ng tắm ri&ecirc;ng. Trong ph&ograve;ng được trang bị truyền h&igrave;nh c&aacute;p, minibar v&agrave; m&aacute;y pha tr&agrave;/c&agrave; ph&ecirc;. Đồ vệ sinh c&aacute; nh&acirc;n miễn ph&iacute;, m&aacute;y sấy t&oacute;c v&agrave; d&eacute;p cũng được cung cấp trong ph&ograve;ng. Một số ph&ograve;ng nh&igrave;n ra quang cảnh th&agrave;nh phố.</p>

<p>Đội ngũ nh&acirc;n vi&ecirc;n th&acirc;n thiện của Anh Duy c&oacute; thể hỗ trợ kh&aacute;ch sắp xếp c&aacute;c tour du lịch v&agrave; đặt v&eacute;. Ngo&agrave;i ra, kh&aacute;ch c&ograve;n được cung cấp dịch vụ cho thu&ecirc; xe đạp v&agrave; xe hơi cũng như giặt l&agrave;. Dịch vụ ph&ograve;ng cũng c&oacute; tại đ&acirc;y v&agrave; bữa s&aacute;ng c&oacute; thể được phục vụ ngay trong ph&ograve;ng nghỉ của kh&aacute;ch.</p>

<p>Đ&acirc;y l&agrave; khu vực ở TP. H&ocirc;̀ Chí Minh m&agrave; kh&aacute;ch y&ecirc;u th&iacute;ch, theo c&aacute;c đ&aacute;nh gi&aacute; độc lập.</p>
',N'images/motel-4.jpg', N'0745898989','7', N'Đường 30 Tháng 4, Phường Hưng Lợi',4.4,N'nhatvuong',1)
INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address], [Ratings], [OwnerID], [Status]) VALUES (N'625781458',N'Nhà Trọ NgocLan',N'<p>Tọa lạc tại vị tr&iacute; trung t&acirc;m ở Quận 1 của Th&agrave;nh phố Hồ Ch&iacute; Minh, kh&aacute;ch sạn cung cấp c&aacute;c ph&ograve;ng được trang bị nội thất giản dị với Wi-Fi miễn ph&iacute;. Nằm c&aacute;ch Chợ Bến Th&agrave;nh 5 ph&uacute;t đi bộ, nơi đ&acirc;y c&oacute; nh&agrave; h&agrave;ng phục vụ c&aacute;c m&oacute;n ăn Việt Nam.</p>

<p><strong>Nh&agrave; Trọ NgocLan </strong>Nguyễn C&ocirc;ng Trứ The Bitexco Neighbour nằm trong b&aacute;n k&iacute;nh 30 ph&uacute;t l&aacute;i xe từ S&acirc;n bay Quốc tế T&acirc;n Sơn Nhất v&agrave; 700 m từ c&aacute;c điểm tham quan như Dinh Độc Lập cũng như Nh&agrave; thờ Đức B&agrave;.</p>

<p>C&aacute;c ph&ograve;ng m&aacute;y lạnh tại đ&acirc;y c&oacute; s&agrave;n l&aacute;t gạch v&agrave; ph&ograve;ng tắm ri&ecirc;ng. Trong ph&ograve;ng được trang bị truyền h&igrave;nh c&aacute;p, minibar v&agrave; m&aacute;y pha tr&agrave;/c&agrave; ph&ecirc;. Đồ vệ sinh c&aacute; nh&acirc;n miễn ph&iacute;, m&aacute;y sấy t&oacute;c v&agrave; d&eacute;p cũng được cung cấp trong ph&ograve;ng. Một số ph&ograve;ng nh&igrave;n ra quang cảnh th&agrave;nh phố.</p>

<p>Đội ngũ nh&acirc;n vi&ecirc;n th&acirc;n thiện của Anh Duy c&oacute; thể hỗ trợ kh&aacute;ch sắp xếp c&aacute;c tour du lịch v&agrave; đặt v&eacute;. Ngo&agrave;i ra, kh&aacute;ch c&ograve;n được cung cấp dịch vụ cho thu&ecirc; xe đạp v&agrave; xe hơi cũng như giặt l&agrave;. Dịch vụ ph&ograve;ng cũng c&oacute; tại đ&acirc;y v&agrave; bữa s&aacute;ng c&oacute; thể được phục vụ ngay trong ph&ograve;ng nghỉ của kh&aacute;ch.</p>

<p>Đ&acirc;y l&agrave; khu vực ở TP. H&ocirc;̀ Chí Minh m&agrave; kh&aacute;ch y&ecirc;u th&iacute;ch, theo c&aacute;c đ&aacute;nh gi&aacute; độc lập.</p>
',N'images/motel-3.jpg', N'0985364865','8', N'Đặng Huy Trứ, Phường Vĩnh Nguyên',4.1,N'nhatvuong',1)
INSERT [tblMotel] ([MotelID], [Name], [Desct], [Image], [Phone], [DistrictID], [Address], [Ratings], [OwnerID], [Status]) VALUES (N'587624587',N'Nhà Trọ Kỳ Nam',N'Desction motel',N'images/motel-2.jpg', N'0985635353','9', N'Hùng Vương, Phường Thanh Hà',3.4,N'chuongmai',1)

INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'1', N'Phòng đơn Ngọc Quân', 150000, N'images/motel-1.jpg', N'1 giường đơn ,20 m²,Tầm nhìn ra khung cảnh
<p>Tầm nh&igrave;n ra khung cản</p>
	<p>Đồ vệ sinh c&aacute; nh&acirc;n miễn ph&iacute;</p>
	<p>Dịch vụ streaming (như l&agrave; Netflix)</p>
	<p>Nh&agrave; vệ sinh</p>
	<p>B&ocirc;̀n tắm hoặc Vòi sen</p>
	<p>S&agrave;n l&aacute;t g</p>
', '587416594',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'2', N'Phòng đôi Ngọc Quân', 250000,N'images/motel-1.jpg', N'1 giường đôi ,30 m²,Tầm nhìn ra khung cảnh

	<p>Tầm nh&igrave;n ra khung cản</p>
	<p>Đồ vệ sinh c&aacute; nh&acirc;n miễn ph&iacute;</p>
	<p>Dịch vụ streaming (như l&agrave; Netflix)</p>
	<p>Giường cực dài (&gt; 2 mét)</p>
	<p>Khăn tắm/Bộ khăn trải giường (c&oacute; thu ph&iacute;)</p>
	<p>Ấm đun nước điện</p>
	<p>&nbsp;</p>
', '587416594',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'3', N'Phòng gia đình Ngọc Quân', 499000,N'images/motel-1.jpg', N'2 giường đôi ,30 m²,Tầm nhìn ra khung cảnh', '587416594',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'4', N'Phòng đơn Ánh Dương', 200000, N'images/motel-2.jpg', N'1 giường đơn ,20 m²,Tầm nhìn ra khung cảnh
<p>Đi&ecirc;̣n thoại</p>
	<p>Máy s&acirc;́y tóc</p>
	<p>Giường cực dài (&gt; 2 mét)</p>
	<p>Khăn tắm/Bộ khăn trải giường (c&oacute; thu ph&iacute;)</p>
	<p>Ấm đun nước điện</p>
	<p>&nbsp;</p>
', '842578129',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'5', N'Phòng đôi Ánh Dương', 351000,N'images/motel-2.jpg', N'1 giường đôi ,30 m²,Tầm nhìn ra khung cảnh', '842578129',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'6', N'Phòng đơn Gia Lai', 145000, N'images/motel-1.jpg', N'1 giường đơn ,20 m²,Tầm nhìn ra khung cảnh', '486258478',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'7', N'Phòng đôi Malibu Beach', 350000,N'images/motel-1.jpg', N'1 giường đôi ,30 m²,Tầm nhìn ra khung cảnh<br> <p>32 m&sup2; -Nh&igrave;n ra địa danh nổi tiếng</p>

<p>Nh&igrave;n ra th&agrave;nh phố -Nh&igrave;n ra s&ocirc;ng</p>

<p>Điều h&ograve;a kh&ocirc;ng kh&iacute;-Ph&ograve;ng tắm ri&ecirc;ng trong ph&ograve;ng</p>

<p>TV m&agrave;n h&igrave;nh phẳng- Hệ thống c&aacute;ch &acirc;m</p>
', '861435762',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'8', N'Phòng gia đình Ladalat', 499000,N'images/motel-1.jpg', N'<p>32 m&sup2; -Nh&igrave;n ra địa danh nổi tiếng</p>

<p>Nh&igrave;n ra th&agrave;nh phố -Nh&igrave;n ra s&ocirc;ng</p>

<p>Điều h&ograve;a kh&ocirc;ng kh&iacute;-Ph&ograve;ng tắm ri&ecirc;ng trong ph&ograve;ng</p>

<p>TV m&agrave;n h&igrave;nh phẳng- Hệ thống c&aacute;ch &acirc;m</p>
', '548762589',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'9', N'Phòng đơn Vạn Phúc', 198000, N'images/motel-2.jpg', N'<p>32 m&sup2; -Nh&igrave;n ra địa danh nổi tiếng</p>

<p>Nh&igrave;n ra th&agrave;nh phố -Nh&igrave;n ra s&ocirc;ng</p>

<p>Điều h&ograve;a kh&ocirc;ng kh&iacute;-Ph&ograve;ng tắm ri&ecirc;ng trong ph&ograve;ng</p>

<p>TV m&agrave;n h&igrave;nh phẳng- Hệ thống c&aacute;ch &acirc;m</p>
', '473658715',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'10', N'Phòng đôi Vạn Phúc', 351000,N'images/motel-2.jpg', N'1 giường đôi ,30 m²,Tầm nhìn ra khung cảnh', '473658715',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'11', N'Phòng VinHome', 69000,N'images/motel-1.jpg', N'2 giường đôi ,30 m²,Tầm nhìn ra khung cảnh', '785146827',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'12', N'Phòng đơn NgocLan', 100000, N'images/motel-2.jpg', N'1 giường đơn ,20 m²,Tầm nhìn ra khung cảnh', '625781458',1)
INSERT [tblRoomType] ([RoomTypeID], [TypeName], [Price], [Image], [Desct],[MotelID], [Status]) VALUES (N'13', N'Phòng đôi Kỳ Nam', 245000,N'images/motel-2.jpg', N'<p>32 m&sup2; -Nh&igrave;n ra địa danh nổi tiếng</p>

<p>Nh&igrave;n ra th&agrave;nh phố -Nh&igrave;n ra s&ocirc;ng</p>

<p>Điều h&ograve;a kh&ocirc;ng kh&iacute;-Ph&ograve;ng tắm ri&ecirc;ng trong ph&ograve;ng</p>

<p>TV m&agrave;n h&igrave;nh phẳng- Hệ thống c&aacute;ch &acirc;m</p>
', '587624587',1)

--insert room
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'012414785', N'01', 1, N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'216587125', N'02', 0, N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'219657756', N'03', 0 ,N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'765324124', N'04', 2,N'2')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'895365765', N'05', 0,N'2')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'244714724', N'06', 0,N'2')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'658715137', N'07', 0, N'3')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'247965765', N'08', 0, N'3')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'735947138', N'09', 0, N'3')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'012414754', N'NO 1', 0,N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'487621547', N'NO 2', 0,N'4')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'632658744', N'NO 3',  0, N'4')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'421578965', N'NO 4',  0,N'5')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'249632785', N'NO 5', 0, N'5')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'124525876', N'NO 6', 0,N'6')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'632658452', N'NO 7', 0, N'7')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'758624864', N'NO 8', 0,N'8')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'587953254', N'phong 1', 0, N'9')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'456257895', N'phong 2', 0,N'10')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'248425478', N'phong 3',  1, N'11')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'851658754', N'phong 4', 0, N'12')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'236587157', N'phong 5', 0,N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'236854824', N'phong 6', 0,N'2')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'895621458', N'phong 7', 0, N'3')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'548587526', N'phong 8', 0,N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'326584957', N'phong 9', 0,N'2')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'452713658', N'phong 10', 0, N'3')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'986554787', N'phong 11', 0, N'4')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'845764818', N'num 1', 0, N'5')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'632548789', N'num 2', 0, N'6')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'124569832', N'num 3', 0, N'7')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'865741253', N'num 4', 0, N'8')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'325487958', N'num 5', 0, N'9')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'986525487', N'num 6', 0, N'10')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'956325478', N'num 7', 0, N'11')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'871245872', N'num 8',0, N'12')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'985568725', N'num 9', 0, N'13')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'112547695', N'num 10', 0, N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'365982589', N'num 11', 0, N'2')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'245782168', N'phòng số 1', 0, N'3')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'626356896', N'phòng số 2', 0, N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'842565836', N'phòng số 3', 1, N'2')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'895658269', N'phòng số 4', 0, N'3')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'124858468', N'phòng số 5', 0, N'4')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'642766983', N'phòng số 6',0, N'5')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'528495989', N'phòng số 7',0, N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'663289984', N'phòng số 8', 0, N'2')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'215487599', N'phòng số 9', 0, N'3')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'854577756', N'phòng số 10', 0, N'4')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'326556884', N'phòng số 11', 0, N'5')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'521487545', N'Room 01', 0, N'6')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'521477856', N'Room 02',0, N'7')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'632356985', N'Room 03', 0, N'1')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'784125569', N'Room 04', 0, N'9')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'336598852', N'Room 05', 0, N'8')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'745447857', N'Room 06', 0, N'10')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'225657877', N'Room 07', 1, N'3')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'632577896', N'Room 08', 0, N'4')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'996532157', N'Room 09', 0, N'5')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'323565985', N'Room 10', 1, N'6')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'747569865', N'Room 11',0, N'7')
INSERT [tblRoom] ([RoomID], [Name], [Status], [RoomTypeID]) VALUES (N'332369568', N'Room 12', 1, N'8')

--INSERT service 
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'489656859', N'Coca', 15000, 1, N'587416594')
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'021586822', N'lavie', 10000, 1, N'587416594')
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'565468569', N'bánh', 17000, 1, N'587416594')
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'563958176', N'khăn ướt', 5000, 1, N'587416594')
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'556558557', N'7 up', 15000, 1, N'587416594')
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'558579558', N'Coca', 15000, 1, N'842578129')
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'632452177', N'lavie', 10000, 1, N'842578129')
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'986587453', N'bánh', 17000, 1, N'842578129')
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'323201578', N'khăn ướt', 5000, 1, N'842578129')
INSERT [tblService] ([ServiceID], [ServiceName], [Price], [Status], [MotelID]) VALUES (N'012495547', N'7 up', 15000, 1, N'842578129')


--INSERT Notification

INSERT [tblNotification] ([AnnouncementID], [Title],[Desct], [Date], [UserID]) VALUES ('notifi01', N'Bạn có đơn đặt phòng mới',N'Bạn có đơn đặt phòng mới chi tiết xem tại đây', '2002-01-01','quan01') 
INSERT [tblNotification] ([AnnouncementID], [Title],[Desct], [Date], [UserID]) VALUES ('notifi02', N'Bạn có phòng đang trả',N'Phòng số 2 ở Motel 02 , khách đã trả phòng', '2002-01-01','tu06') 

INSERT [tblNotification] ([AnnouncementID], [Title],[Desct], [Date], [UserID]) VALUES ('notifi03', N'Bạn vừa đặt phòng thành công',N'Bạn vừa đặt phòng xong, vui lòng kiểm tra lại hóa đơn chi tiết', '2002-01-01','duy05') 
INSERT [tblNotification] ([AnnouncementID], [Title],[Desct], [Date], [UserID]) VALUES ('notifi04', N'Bạn vừa trả phòng',N'Bạn vừa trả phòng hãy đánh giá', '2002-01-01','duy05') 


---INSERT Booking

INSERT [tblBooking] ([BookingID], [BookingDate],[Desct], [Total],[Status], [UserID]) VALUES ('booking01', '2001-05-07',N'Booking table', 420900,2,'duy05') 
INSERT [tblBooking] ([BookingID], [BookingDate],[Desct], [Total],[Status], [UserID]) VALUES ('booking02', '2022-11-08',N'Booking table', 710900,1,'duy05') 
INSERT [tblBooking] ([BookingID], [BookingDate],[Desct], [Total],[Status], [UserID]) VALUES ('booking03', '2021-08-09',N'Booking table', 747900,1,'hai03') 
INSERT [tblBooking] ([BookingID], [BookingDate],[Desct], [Total],[Status], [UserID]) VALUES ('booking04', '2022-10-10',N'Booking table', 542900,2,'tuan04') 
INSERT [tblBooking] ([BookingID], [BookingDate],[Desct], [Total],[Status], [UserID]) VALUES ('booking05', '2022-12-10',N'khach nhan phong', 340900,2,'Lamm44')
INSERT [tblBooking] ([BookingID], [BookingDate],[Desct], [Total],[Status], [UserID]) VALUES ('booking06', '2022-12-10',N'khach nhan cung ngay', 100900,0,'hai03')
INSERT [tblBooking] ([BookingID], [BookingDate],[Desct], [Total],[Status], [UserID]) VALUES ('booking07', '2022-12-10',N'khach nhan phong', 157900,2,'Lamm44')

---INSERT BookingDetail

INSERT [tblBookingDetail] ([BookingDetailID], [RoomID],[BookingID],[Time]) VALUES ('bookDt01', '012414785','booking01',2) 
INSERT [tblBookingDetail] ([BookingDetailID], [RoomID],[BookingID],[Time]) VALUES ('bookDt02', '765324124','booking02',1) 
INSERT [tblBookingDetail] ([BookingDetailID], [RoomID],[BookingID],[Time]) VALUES ('bookDt03', '248425478','booking03',2) 
INSERT [tblBookingDetail] ([BookingDetailID], [RoomID],[BookingID],[Time]) VALUES ('bookDt04', '842565836','booking04',1) 
INSERT [tblBookingDetail] ([BookingDetailID], [RoomID],[BookingID],[Time]) VALUES ('bookDt05', '323565985','booking05',5) 
INSERT [tblBookingDetail] ([BookingDetailID], [RoomID],[BookingID],[Time]) VALUES ('bookDt06', '332369568','booking06',7) 
INSERT [tblBookingDetail] ([BookingDetailID], [RoomID],[BookingID],[Time]) VALUES ('bookDt07', '225657877','booking07',1) 



---INSERT Payment

INSERT [tblPayment] ([PaymentID], [Desct], [PaymentTime],[Sender], [Receiver],[PaymentTypeName]) VALUES ('booking01',N'payment01 table', '2021-02-02','Nguyen Huu Tuan','Tran Ngoc Tu',N'Tien mat') 
INSERT [tblPayment] ([PaymentID], [Desct], [PaymentTime],[Sender], [Receiver],[PaymentTypeName]) VALUES ('booking02', N'payment01 table', '2021-02-02','Nguyen Huu Tuan','Tran Ngoc Tu',N'Chuyển khoản') 
INSERT [tblPayment] ([PaymentID], [Desct], [PaymentTime],[Sender], [Receiver],[PaymentTypeName]) VALUES ('booking03',N'payment01 table', '2021-02-02','Tran Ngoc Hai','Le Quan',N'Chuyển khoản') 
INSERT [tblPayment] ([PaymentID], [Desct], [PaymentTime],[Sender], [Receiver],[PaymentTypeName]) VALUES ('booking04',N'payment01 table', '2021-02-02','Nguyen Huu Doan','Le Quan',N'Tien mat') 
INSERT [tblPayment] ([PaymentID], [Desct], [PaymentTime],[Sender], [Receiver],[PaymentTypeName]) VALUES ('booking05',N'payment in day', '2022-12-11','Tran Van Lam','Le Quan',N'Tien mat')
INSERT [tblPayment] ([PaymentID], [Desct], [PaymentTime],[Sender], [Receiver],[PaymentTypeName]) VALUES ('booking06',N'payment01 table', '2021-02-02','Tran Ngoc Hai','Tran Ngoc Tu',N'Chuyển khoản') 
INSERT [tblPayment] ([PaymentID], [Desct], [PaymentTime],[Sender], [Receiver],[PaymentTypeName]) VALUES ('booking07',N'payment01 table', '2021-02-02','Tran Ngoc Hai','Nguyen Quang',N'Tien mat') 


---INSERT Feedback
INSERT [tblFeedBack] ([FeedbackID],[Desct], [Ratings],[MotelID], [BookingID],[Status]) VALUES ('1',N'Nhà trọ chất lượng tốt', 5,N'587416594',N'booking01',1)
INSERT [tblFeedBack] ([FeedbackID],[Desct], [Ratings],[MotelID], [BookingID],[Status]) VALUES ('2', N'Đánh giá 5 sao', 5,N'842578129',N'booking02',1) 
INSERT [tblFeedBack] ([FeedbackID],[Desct], [Ratings],[MotelID], [BookingID],[Status]) VALUES ('3', N'Dịch vụ tốt', 5,N'486258478',N'booking03',1) 
INSERT [tblFeedBack] ([FeedbackID],[Desct], [Ratings],[MotelID], [BookingID],[Status]) VALUES ('4',N'Phòng rất sạch sẽ', 4,N'587416594',N'booking04',1) 
INSERT [tblFeedBack] ([FeedbackID],[Desct], [Ratings],[MotelID], [BookingID],[Status]) VALUES ('5', N'Nhân viên phục vụ tốt', 4,N'861435762',N'booking01',1)
INSERT [tblFeedBack] ([FeedbackID],[Desct], [Ratings],[MotelID], [BookingID],[Status]) VALUES ('6',N'Phòng rất đẹp', 4,N'861435762',N'booking01',1)


---INSERT Report
INSERT [tblReport] ([ReportID], [UserID],[Title], [Desct],[Date], [MotelID],[Status]) VALUES ('1', N'doan07',N'bao cao owner', N'Owner nay khong tot','2022-05-05', '587624587',0) 
INSERT [tblReport] ([ReportID], [UserID],[Title], [Desct],[Date],[MotelID],[Status]) VALUES ('2', N'duy05',N'bao cao owner', N'Nhà trọ không đúng như mô tả','2021-05-05','625781458',0) 
INSERT [tblReport] ([ReportID], [UserID],[Title], [Desct],[Date],[MotelID],[Status]) VALUES ('3', N'tuan04',N'bao cao owner', N'Owner nay khong tot','2022-05-05','625781458',0) 
INSERT [tblReport] ([ReportID], [UserID],[Title], [Desct],[Date],[MotelID],[Status]) VALUES ('4', N'doan07',N'bao cao owner', N'Nhà trọ này chém giá','2022-05-05', '587624587',1) 
INSERT [tblReport] ([ReportID], [UserID],[Title], [Desct],[Date],[MotelID],[Status]) VALUES ('5', N'doan07',N'bao cao owner', N'Owner nay khong tot','2022-05-05', '587624587',1) 


---INSERT BookingServiceDetail

INSERT [tblBookingServiceDetail] ([BookingSeviceDetailID], [ServiceID],[BookingID], [Quantity],[Total]) VALUES ('1', '489656859','booking01', 3,15000) 
INSERT [tblBookingServiceDetail] ([BookingSeviceDetailID], [ServiceID],[BookingID], [Quantity],[Total]) VALUES ('2', '021586822','booking02', 2,10000) 
INSERT [tblBookingServiceDetail] ([BookingSeviceDetailID], [ServiceID],[BookingID], [Quantity],[Total]) VALUES ('3', '565468569','booking03', 5,17000) 
INSERT [tblBookingServiceDetail] ([BookingSeviceDetailID], [ServiceID],[BookingID], [Quantity],[Total]) VALUES ('4', '489656859','booking04', 1,15000) 

