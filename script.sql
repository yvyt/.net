USE [ItJob]
GO
/****** Object:  Table [Blog]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Blog](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[meta] [varchar](250) NULL,
	[title] [nvarchar](500) NULL,
	[content_story] [ntext] NULL,
	[CategoryId] [bigint] NULL,
	[displayOrder] [int] NULL,
	[hide] [bit] NULL,
	[dateBegin] [datetime] NOT NULL,
	[createBy] [varchar](50) NOT NULL,
	[dateModife] [datetime] NOT NULL,
	[modifedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [BlogCategory]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BlogCategory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[link] [varchar](250) NULL,
	[meta] [varchar](250) NULL,
	[displayOrder] [int] NULL,
	[hide] [bit] NULL,
	[dateBegin] [datetime] NOT NULL,
	[createBy] [varchar](50) NOT NULL,
	[dateModife] [datetime] NOT NULL,
	[modifedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Comments]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Comments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[CompanyID] [bigint] NOT NULL,
	[ContentComment] [ntext] NULL,
	[star] [float] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Company]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Company](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[meta] [varchar](250) NULL,
	[type] [varchar](250) NOT NULL,
	[country] [nvarchar](250) NULL,
	[location] [nvarchar](250) NOT NULL,
	[website] [varchar](250) NOT NULL,
	[detail] [ntext] NOT NULL,
	[contact] [varchar](50) NULL,
	[hide] [bit] NULL,
	[dateBegin] [datetime] NULL,
	[createBy] [varchar](50) NULL,
	[dateModife] [datetime] NULL,
	[modifedBy] [varchar](50) NULL,
	[showOnHome] [bit] NULL,
	[Tags] [nvarchar](500) NULL,
	[image] [varchar](500) NOT NULL,
	[jobID] [bigint] NOT NULL,
	[OT] [bit] NULL,
	[employers] [int] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Contact]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[contentD] [ntext] NULL,
	[hide] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Feedback]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Feedback](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[sdt] [nvarchar](50) NULL,
	[createDate] [nchar](10) NOT NULL,
	[contentF] [ntext] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Footer]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Footer](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[contentF] [ntext] NULL,
	[hide] [bit] NULL,
	[type] [nvarchar](50) NOT NULL,
	[columnIndex] [int] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Job]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Job](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[levelJ] [nvarchar](250) NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](500) NULL,
	[salary] [decimal](18, 0) NULL,
	[categoryID] [int] NULL,
	[meta] [varchar](250) NULL,
	[detail] [ntext] NULL,
	[hide] [bit] NULL,
	[dateBegin] [datetime] NULL,
	[createBy] [varchar](50) NOT NULL,
	[dateModife] [datetime] NOT NULL,
	[modifedBy] [varchar](50) NOT NULL,
	[topHot] [datetime] NULL,
	[numberView] [int] NULL,
	[Tags] [nvarchar](500) NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [JobCategory]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JobCategory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[link] [varchar](250) NOT NULL,
	[meta] [varchar](250) NULL,
	[displayOrder] [int] NULL,
	[hide] [bit] NULL,
	[dateBegin] [datetime] NOT NULL,
	[createBy] [varchar](50) NOT NULL,
	[dateModife] [datetime] NOT NULL,
	[modifedBy] [varchar](50) NOT NULL,
	[showOnHome] [bit] NULL,
 CONSTRAINT [PK_JobCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Menu]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Menu](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[link] [nvarchar](250) NULL,
	[meta] [nvarchar](250) NULL,
	[modifedBy] [varchar](50) NOT NULL,
	[displayOrder] [int] NULL,
	[hide] [bit] NOT NULL,
	[inner_menu] [bigint] NULL,
	[dateBegin] [datetime] NOT NULL,
	[createBy] [varchar](50) NOT NULL,
	[dateModife] [datetime] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Slide]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Slide](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](250) NULL,
	[displayOrder] [int] NOT NULL,
	[link] [nvarchar](250) NULL,
	[description] [nvarchar](250) NOT NULL,
	[hide] [bit] NULL,
	[dateBegin] [datetime] NOT NULL,
	[createBy] [varchar](50) NOT NULL,
	[dateModife] [datetime] NOT NULL,
	[modifedBy] [varchar](50) NOT NULL,
	[title] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Story]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Story](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[meta] [varchar](250) NULL,
	[title] [nvarchar](500) NULL,
	[content_story] [ntext] NULL,
	[displayOrder] [int] NULL,
	[hide] [bit] NULL,
	[dateBegin] [datetime] NOT NULL,
	[createBy] [varchar](50) NOT NULL,
	[dateModife] [datetime] NOT NULL,
	[modifedBy] [varchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Tag]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[link] [varchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [TagCompany]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TagCompany](
	[ComanyID] [bigint] NOT NULL,
	[TagID] [bigint] NOT NULL,
 CONSTRAINT [PK_TagCompany] PRIMARY KEY CLUSTERED 
(
	[ComanyID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [TagJob]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TagJob](
	[JobID] [bigint] NOT NULL,
	[TagID] [bigint] NOT NULL,
 CONSTRAINT [PK_TagJob] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [User]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[role] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [UserApply]    Script Date: 30-Mar-23 1:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserApply](
	[UserId] [bigint] NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Status] [bit] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_UserApply] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Blog] ON 

INSERT [Blog] ([id], [meta], [title], [content_story], [CategoryId], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (1, N'dinh-huong-nghe-nghiep-cho-developer-2023', N'Định hướng nghề nghiệp cho Developer năm 2023', N'Định hướng nghề nghiệp là việc đưa ra các quyết định lựa chọn cho công việc và nghề nghiệp của bản thân trong tương lai. Không riêng gì các Developer, các cá nhân trong bất cứ ngành nghề nào muốn phát triển sự nghiệp cũng cần có định hướng nghề nghiệp cho riêng mình. 

Hãy cùng ITviec tìm hiểu các yếu tố có thể ảnh hưởng tới lựa chọn nghề nghiệp của Developer trong bài viết sau, cũng như những lời khuyên về định hướng nghề nghiệp trong năm 2023 để sự nghiệp thăng hạng. 

Định hướng nghề nghiệp là gì?
Định hướng nghề nghiệp là hướng đi mà một cá nhân chọn, về mặt nghề nghiệp, trong suốt cuộc đời của họ. Nếu một người luôn chọn hoặc theo đuổi một loại công việc nhất định, hoặc một công việc trong một lĩnh vực cụ thể, thì đây có thể được xem là định hướng nghề nghiệp của họ.

Định hướng nghề nghiệp có thể xuất phát từ sở thích hoặc khả năng nổi trội. Đối với những người đã đi làm, định hướng nghề nghiệp là vạch ra các bước đi đúng đắn để có thể phát triển sự nghiệp theo hướng đó trong tương lai xa. Bạn cần phải biết đích đến của mình ở đâu? Những chặng đường nào mình cần phải đi qua để có thể tới được đích? 

Nhiều cá nhân phát triển nghề nghiệp không chỉ dựa trên sở thích hay năng lực của họ, mà còn dựa trên cách họ thích làm việc. Ví dụ, một số người thực sự thích làm việc theo nhóm, trong khi những người khác làm việc độc lập tốt hơn. Một số người thích sáng tạo, trong khi những người khác muốn có những nhiệm vụ cụ thể để hoàn thành mỗi ngày. Một số người thích làm việc với đồng nghiệp ở văn phòng, trong khi có những người cảm thấy làm việc từ xa hiệu quả hơn. Mỗi khía cạnh tính cách này có thể giúp tạo nên định hướng nghề nghiệp.

Định hướng nghề nghiệp có vai trò như thế nào với Developer?
Đối với lĩnh vực lập trình, các yếu tố có thể tác động đến định hướng nghề nghiệp của Developer có thể xuất phát từ sở thích và năng lực cá nhân, hay từ tác động của môi trường như cơ hội việc làm, xu hướng thị trường, mức lương. Ngoài việc là vị trí được trả lương cao và được săn đón nhiều, Developer còn có cơ hội thử sức ở nhiều dự án khác nhau, từ đó tìm được định hướng nghề nghiệp phù hợp nhất.

Tham khảo các định hướng nghề nghiệp dành cho Developer tại đây.

Định hướng nghề nghiệp giúp Developer khoanh vùng phạm vi để có thể phát huy tốt nhất khả năng của mình, rút ngắn thời gian đạt đến vị trí mong muốn, hạn chế các sai lầm trong lựa chọn công việc, hoặc phải làm những việc bản thân không thích hoặc không phù hợp.

Triển vọng nghề nghiệp của Developer, theo số liệu gần nhất từ cục Thống kê Hoa Kỳ, vẫn rất tươi sáng trong vòng 8 năm tới. Cụ thể, số lượng dự án cần nguồn lực kỹ sư phần mềm (vốn được biết đến rộng rãi như Developer tại Việt Nam) sẽ tăng trưởng 26% trong giai đoạn 2021-2031.', 3, 0, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Blog] ([id], [meta], [title], [content_story], [CategoryId], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (2, N'qa-la-gi-qc-khac-gi-qa', N'QA là gì? QA và QC có phải là một vị trí giống nhau?', N'QA là gì? QC là gì? Công việc cụ thể của từng vị trí trong quy trình phát triển sản phẩm như thế nào?

Đọc bài viết này để tìm hiểu ngay:

QA là gì? QA là người chịu trách nhiệm đảm bảo chất lượng sản phẩm thông qua việc đưa ra quy trình làm việc giữa các bên liên quan.
QC là gì? QC là người chịu trách nhiệm thực hiện công việc kiểm tra chất lượng phần mềm.
Nhân viên QA khác gì nhân viên QC.
Xem hàng trăm việc làm QA QC trên ITviec

QA là gì?
QA là gì?

QA là viết tắt của cụm từ Quality Assurance. QA là người chịu trách nhiệm đảm bảo chất lượng sản phẩm thông qua việc đưa ra quy trình làm việc giữa các bên liên quan.

QA là làm gì?
Đề xuất, đưa ra quy trình phát triển (development process) sản phẩm phù hợp với yêu cầu cụ thể của từng dự án. Các quy trình này có thể được phát triển dựa trên V-model hay Agile (đa số là Scrum hoặc Lean Development). Hoặc thông qua việc áp dụng những quy trình quản lý sẵn có như ISO hay CMMI.
Đưa ra những tài liệu, biểu mẫu, hướng dẫn để đảm bảo chất lượng của sản phẩm cho tất cả các bộ phận trong nhóm phát triển sản phẩm.
Kiểm tra, audit việc thực thi quy trình của các bộ phận trong nhóm làm sản phẩm có đúng quy trình QA đã đề ra không.
Nhắc nhở đội ngũ phát triển sản phẩm việc tuân thủ theo quy trình làm việc đã đưa ra.
Điều chỉnh, thay đổi quy trình phù hợp với từng sản phẩm mà các team đang thực hiện.
Tuyển dụng QA của FPT IS
Tư vấn về quy trình cho dự án để đảm bảo chất lượng toàn dự án.
Kiểm soát việc thực hiện quy trình của dự án.
Thu nhận và theo dõi các ý kiến phản hồi khách hàng.
Thực hiện kiểm duyệt lần cuối (Final inspection) đối với những sản phẩm bàn giao cho khách hàng để đảm bảo chất lượng đúng như cam kết.
Thực hiện việc đo đạc và phân tích số liệu để đánh giá chất lượng sản phẩm.
Cải tiến quy trình.
Xem thêm những mẫu tuyển dụng việc làm QA tại ITviec.

Việc làm QA tại TP. HCM
Việc làm QA tại Hà Nội
Kỹ năng cần thiết của QA là gì?
Hiểu sâu về kiến trúc hệ thống của phần mềm vì công việc của QA rộng hơn QC.
Khả năng tổ chức, tư duy logic và có hệ thống.
Kỹ năng phân tích, làm việc dựa trên số liệu tốt.
Kiến thức rộng về các lĩnh vực của phần mềm mà các team đang thực hiện.
Kỹ năng giao tiếp trong nội bộ team và các team khác. Mục đích: khai thác thông tin về sản phẩm, dự án và ứng dụng nó vào việc xây dựng hệ thống quy trình.
Hiểu rõ về các chứng chỉ CMMI, ISO… trong phần mềm để xây dựng các quy trình chuẩn cho các team.', 1, 1, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Blog] ([id], [meta], [title], [content_story], [CategoryId], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (5, N'dien-toan-dam-may-la-gi', N'Điện toán đám mây là gì? Khái niệm cơ bản, phân loại và ứng dụng thực tế', N'Điện toán đám mây là gì? Khái niệm cơ bản, phân loại và ứng dụng thực tế', 1, 2, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Blog] ([id], [meta], [title], [content_story], [CategoryId], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (6, N'framework-la-gi-top-framework-pho-bien-nhat', N'Top 15+ framework back-end, front-end và mobile phổ biến nhất 2023', N'Top 15+ framework back-end, front-end và mobile phổ biến nhất 2023', 1, 3, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [Blog] OFF
GO
SET IDENTITY_INSERT [BlogCategory] ON 

INSERT [BlogCategory] ([id], [title], [description], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (1, N'Chuyên môn IT', N'Cập nhật kiến thức về các ngôn ngữ lập trình, công nghệ ngành IT và tự học với 100+ tài liệu lập trình IT sau đây. Khám phá ngay!', NULL, N'_chuyen_mon_it', 0, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [BlogCategory] ([id], [title], [description], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (2, N'Ứng tuyển & Thăng tiến', N'Từ cách viết CV đến phỏng vấn, deal lương. Tận dụng lời khuyên từ người thật, việc thật. Sớm thành "pro", chốt luôn công việc IT tuyệt vời như ý muốn!', NULL, N'_ung_tuyen_thang_tien', 1, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [BlogCategory] ([id], [title], [description], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (3, N'Sự nghiệp IT', N'Không bao giờ là quá muộn để trở nên xuất sắc trong ngành IT. Từ hình mẫu thực tế, khám phá con đường sự nghiệp IT cho riêng bạn.', NULL, N'_su_nghiep_it', 2, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [BlogCategory] ([id], [title], [description], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (5, N'Lương & Chế độ làm việc', N'Mức lương thực tế của các vị trí IT như bạn là bao nhiêu? Mong đợi về chế độ làm việc và đãi ngộ có gì khác nhau? Tìm hiểu ngay.', NULL, N'_luong_che_do_lam_viec', 3, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [BlogCategory] OFF
GO
SET IDENTITY_INSERT [Comments] ON 

INSERT [Comments] ([id], [name], [CompanyID], [ContentComment], [star]) VALUES (1, N'Tzy', 3, N'Môi trường làm việc tốt', 4)
INSERT [Comments] ([id], [name], [CompanyID], [ContentComment], [star]) VALUES (2, N'VyVy', 3, N'Lương cao', 4.5)
SET IDENTITY_INSERT [Comments] OFF
GO
SET IDENTITY_INSERT [Company] ON 

INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (3, N'LARION', N'_larion   ', N'Outsourcing', N'Việt Nam', N'Tầng 3, Tòa nhà QTSC 1, Công viên Phần Mềm Quang Trung, P. Tân Chánh Hiệp, Quận 12', N'https://larion.com/', N'LARION has been providing innovative outsourcing services and business solutions to many successful clients in more than 15 countries for over 18 years. Our wide range of services includes Big Data/ Data Analytics, Securities Trading Solutions, Surround Core Banking Solutions, E-commerce/ Social Network App Development and Web App Development. We focus on today’s trends of Big Data, Cloud Computing, Social Network, Mobility and Internet of Things', NULL, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0, NULL, N'/Assets/home/images/company/Thumbnail LAR.png', 8, 1, 50)
INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (6, N'HRS GROUP', N'_hrs_group', N'Outsourcing', N'Germany', N'Tân Chánh Hiệp, Quận 12, Thành phố Hồ Chí Minh', N'https://www.hrs.com/enterprise/', N'HRS is reinventing the way businesses and governments work, stay and pay in today’s dynamic global marketplace. HRS’ advanced platform technology is extending its reach beyond hospitality to meetings, office space management, payment efficiency and crisis recovery. Beyond cost savings in the global post-pandemic economy, HRS clients gain from an unrivaled focus on essential aspects including safety, security and satisfaction. HRS is also recognized for its award-winning Green Stay Initiative, technology that helps corporate hotel programs achieve their NetZero targets, and its groundbreaking Crew & Passengers Solution, which leverages automation to elevate experiences for air and rail operations. ', NULL, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0, NULL, N'/Assets/home/images/company/ART02786.jpg', 11, 0, 100)
INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (7, N'
Halosoft', N'_halo_soft', N'Product', N'Việt Nam', N'758/35 Xô Viết Nghệ Tĩnh, Phường 25, Binh Thanh, Ho Chi Minh', N'https://www.halothemes.com/', N'Halosoft specialises in making awesome Shopify Templates, Bigcommerce Templates & Add ons, 3dcart Templates.

We have groups of talented, friendly and hard working that love crafting beautiful Templates. If you are looking for a place where you can work with passion, Join with us now. What are are waiting for?

We always look for Right people :)', NULL, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 1, NULL, N'/Assets/home/images/company/5c93173ac7294_1553143610.png', 13, 1, 50)
INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (10, N'Onpoint', N'_onpoint  ', N'Product', N'Việt Nam', N'27B Nguyễn Đình Chiểu, Đa Kao, Quận 1, Thành phố Hồ Chí Minh 84000', N'https://www.onpoint.vn/', N'E-commerce solution partner, help brands & retailers become more successful in Vietnam & SEA region

Onpoint is an E-commerce solution partner, helping brands and retailers become more successful in Vietnam and SEA region. We provide high quality, transparent, end-to-end services.

Vision: Our vision is to be the No.1 E-commerce Service Partner in Southeast Asia
Mission: Our mission is to make e-commerce easy for brands, and retailers, and to create sustainable value for businesses, consumers, and partners.
', N'028 7305 6686', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0, NULL, N'/Assets/home/images/company/onpoint-logo.png', 15, 1, 30)
INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (13, N'
IVC (ISB Vietnam)', N'_ivc_isb_vietnam', N'Outsourcing', N'Japan', N'Etown 2, 364 Cong Hoa
Tan Binh
Ho Chi Minh', N'https://isb-vietnam.com.vn/', N'ISB Vietnam Company Limited was established in 2003 with 100% investment of ISB Corporation

Our Business Model:

- Outsourcing/Offshoring:

+ Business Application Development: Finance/Banking/Securities, Business Application/Sustem, Medical Susrem, Web System/Application.

+ Mobile Development: Mobile/Smartphone App, Middleware/Embedded Software, Protocol Stack/ Communication control, Cloud/Server Application.', NULL, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0, NULL, N'/Assets/home/images/company/isb-vietnam-company-logo.jpg', 21, 0, 70)
INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (14, N'Techbase VietNam', N'_techbase_vietnam', N'Product', N'Japan', N'Tầng 10, Tháp 2, Tòa nhà Saigon Centre, 67 Lê Lợi, phường Bến Nghé
District 1
Ho Chi Minh', N'https://www.techbasevn.com/', N'LET''S CREATE THE INTERNET''S FUTURE TOGETHER! 
TECHBASE VIỆT NAM (TBV) được thành lập vào tháng 5/2015 với vốn đầu tư 100% bởi Yahoo! JAPAN CORPORATION - một công ty công nghệ hàng đầu xứ Phù Tang.
', NULL, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0, NULL, N'/Assets/home/images/company/techbase.png', 22, 0, 100)
INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (18, N'Eureka Robotics', N'_eureka_robotics', N'Product', N'Singapore', N'71 Nguyễn Chí Thanh, Ba Đình, Hà Nội, Vietnam', N'https://eurekarobotics.com/', N'Eureka Robotics, chúng tôi muốn trở thành một phần của tương lai đó. Chúng tôi phát triển các công nghệ và sản phẩm rô-bốt để tự động hóa những thứ thông thường, để con người có thể tập trung vào sáng tạo. Chúng tôi tập trung vào những thách thức tự động hóa bổ ích nhất, chẳng hạn như những thách thức liên quan đến Độ chính xác cao và Tính linh hoạt cao.', N'contact@eurekarobotics.com', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0, NULL, N'/Assets/home/images/company/robotic.png', 26, 0, 20)
INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (20, N'THE INNOVATION GUYS
', N'_the_innovation_guys', N'Product', N'Việt Nam', N'29 Nguyen Van Mai Street, Ward 8, District 3, Ho Chi Minh ', N'https://www.theinnovationguys.com/', N'The Innovation Guys là một công ty phần mềm tạo ra phần mềm tiên tiến cho ngành bán lẻ và hậu cần. Họ hợp tác với khách hàng để thiết kế các sản phẩm có thể bán được trên thị trường và tương thích với đối tượng mục tiêu của họ. Với hàng chục năm kinh nghiệm, họ đưa ra lời khuyên về công nghệ và quy trình tốt nhất cho nhu cầu cụ thể của từng khách hàng, từ ứng dụng web đến tích hợp hệ thống.', NULL, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0, NULL, N'/Assets/home/images/company/tig.png', 27, 0, 50)
INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (23, N'Allgrowlabo Co.,Ltd.', N'_allgrowlabo_co_ltd', N'Outsourcing', N'Japan', N'An Phu Plaza Building, 117-119 Ly Chinh Thang Street, Ward Vo Thi Sau
District 3
Ho Chi Minh', N'http://allgrow-labo.jp/vn/', N'ALLGROW Group có trụ sở ở Nhật Bản, Việt Nam, Thái với tổng số nhân viên lên đến 200 người.

Thế mạnh của chúng tôi là mảng Front end, chúng tôi hướng đến mục tiêu trở thành công ty phát triển về Front end số một tại Việt Nam.

Mỗi ngày chúng tôi cùng với niềm nhiệt huyết luôn nỗ lực hết mình để tìm ra cách giải quyết đối với những thách thức đến từ hơn 3.000 công ty.', NULL, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0, NULL, N'/Assets/home/images/company/allgr.jpg', 29, 0, 150)
INSERT [Company] ([id], [name], [meta], [type], [country], [location], [website], [detail], [contact], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome], [Tags], [image], [jobID], [OT], [employers]) VALUES (26, N'Viet Capital Securities', N'_viet_capital_securities', N'Product', N'Việt Nam', N'Công ty Cổ phần Chứng khoán Bản Việt – Tầng 15 Tháp tài chính Bitexco, 02 Hải Triều
District 1
Ho Chi Minh', N'https://www.vcsc.com.vn/', N'Viet Capital Securities is a full service securities firm in Vietnam with offices in Ho Chi Minh City and Hanoi. We are licensed by the State Securities Commission to provide a full range of services in areas of securities brokerage, financial advisory, investments and other related investment banking services. We associate ourselves with highest standards and a distinctive working culture for our employees and we’re one of the leading securities firms in Vietnam.', NULL, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0, NULL, N'/Assets/home/images/company/viet_4216987.png', 30, 0, 200)
SET IDENTITY_INSERT [Company] OFF
GO
SET IDENTITY_INSERT [Footer] ON 

INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (1, N'JobForYou', 1, N'header', 1)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (2, N'Trường Đại Học Tôn Đức Thắng', 1, N'', 1)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (3, N'Nguyễn Hữu Thọ, Quận 7
Việt Nam', 1, N'', 1)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (4, N'Phone: +0123456789', 1, N'', 1)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (7, N'Email:JobsForYou@gmail.com', 1, N'', 1)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (8, N'Trang chủ', 1, N'', 2)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (9, N'Thông tin về chúng tôi', 1, N'', 2)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (10, N'Dịch vụ', 1, N'', 2)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (11, N'Our Services', 1, N'header', 3)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (12, N'Web Design', 1, N'', 3)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (13, N'Web Development', 1, N'', 3)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (14, N'Product Management', 1, N'', 3)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (15, N'Marketing', 1, N'', 3)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (16, N'Graphic Design', 1, N'', 3)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (17, N'Mạng xã hội', 1, N'header', 4)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (18, N'Bạn có thể liên hệ với chúng tôi qua các kênh sau đây', 1, N'', 4)
INSERT [Footer] ([id], [contentF], [hide], [type], [columnIndex]) VALUES (19, N'Liên kết hữu ích', 1, N'header', 2)
SET IDENTITY_INSERT [Footer] OFF
GO
SET IDENTITY_INSERT [Job] ON 

INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (8, N'Senior Backend Developer (Python, Java, Golang)', N'Senior', 5, N'We are looking for a great and proficient backend engineer. You will be one of the most influential people in our organization. You will build high-quality data processing pipelines for a financial product by following well-known backend workflows and best practices. As our engineer', CAST(3000 AS Decimal(18, 0)), 5, N'_senior-backend-developer-python-java-golang', N'Strong programming skills (Python, Java, Go, etc.), with a demonstrated ability to write high-quality and testable code. 
Strong Computer Science fundamentals (with knowledge of Architectural Patterns, Distributed Systems)
Experience with container technology (docker, kubernetes), micro-services, big data processing (spark, kafka, hdfs…), monitoring toolsets (E.g. Loki, Prometheus, Grafana, Sentry) is a BIG PLUS
Experience using relational databases (Postgres, MySQL)
Experienced in handling high-volume data is a big plus
Strong understanding of data structures and algorithms.
Is mature, thoughtful, with the ability to operate in a collaborative, team-oriented culture.
Is a builder and self-starter.
Good logical thinking and critical thinking.
Intermediate written and verbal technical English proficiency in communicating daily with teams remotely ', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (11, N'Mid/Sr Fullstack Javascript Engineer (ReactJS, NodeJS)', N'Sernior', 10, N'
Work on software and system optimizations, helping to identify and remove potential performance bottlenecks
Focus on innovating new and better ways to create solutions that add value and amaze the end user, with a penchant for simple elegant design in every aspect from data structures to code to UI and systems architecture
Work with Agile development methodologies
Use best software engineering practices to write, document, and maintain code', CAST(0 AS Decimal(18, 0)), 3, N'mid-sr-fullstack-javascript-engineer-reactjs-nodejs', N'Good experience in JavaScript, NodeJS, HTML/CSS, React.JS
Willingness to work on UI with attention to details
Hands-on experience in NodeJs backend development
Good knowledge of MicroService development and continuous integration
Good understanding of SCRUM/Agile methodologies
Proficient in using HTML5, JavaScript, CSS3, and other Web front-end skills to restore the project page;
Experience in AWS is nice to have
Good knowledge of flexible layout, making mobile terminal responsive layout and solving screen adaptation problems', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (13, N'Frontend Developer (ReactJS, Javascript, HTML5)', N'Middle', 10, N'NULLDesign and develop highly performant user interfaces on Web, Mobile, Desktop
Execute refactoring and optimization of existing code where necessary
Testing, and resolution of defects and performance issues
Maintain and implement the products', CAST(2000 AS Decimal(18, 0)), 6, N'frontend-developer-reactjs-javascript-htmll', N'2+ years experience in front end development, experience in Javascript, React, CSS, HTML5
Experience in game development
An ability to manage a complex range of tasks and ability to meet agreed on delivery deadlines
An appetite for finding solutions to challenging technical problems
An ability to optimize code, develop high-value products
Able to work independently and with a collaborative approach to working in an organization
English skills are a plus ', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (15, N'Product Owner (Business Analyst, Product Manager)Product Owner (Business Analyst, Product Manager)', N'Senior', 3, N'Having 2+ years of professional experience as a Product Owner, Product Manager or Business Analyst
Having a product mindset & a strong passion for building products
Strong experience in writing functional specifications, describing UX, designing wireframes, explaining business rules
Good Communication, good English skills
Attention to details
', CAST(0 AS Decimal(18, 0)), 7, N'product-owner-business-analyst-product-manager', N'Having 2+ years of professional experience as a Product Owner, Product Manager or Business Analyst
Having a product mindset & a strong passion for building products
Strong experience in writing functional specifications, describing UX, designing wireframes, explaining business rules
Good Communication, good English skills
Attention to details
', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (21, N'Fullstack Developer', N'Middle', 2, N'You will be one of the Fullstack Developer participating in this European project with current investment capital of 2 million USD

Participating in developing web applications using both Front-end and Back-end technologies.
Write functional requirement documents and guides.
Ensure high quality standards and brand consistency
Deliver high quality code following best practices for better performance, user experience, and reusability', CAST(4000 AS Decimal(18, 0)), 3, N'fullstack-developer', N'3+ years of experience in Full-stack software development
Proficiency in at least one server-side programming language such as Java, Python, Ruby, or Node.js, and relevant frameworks such as Spring, Flask, or Express', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (22, N'Senior NodeJS Developer', N'Senior', 4, N'•	Phát triển/bảo trì hệ thống, công cụ cho dịch vụ phân tích dữ liệu  của chúng tôi
•	Giao tiếp với các đồng nghiệp trên khắp Việt Nam và Nhật Bản để hiểu các yêu cầu, vấn đề, kỳ vọng; đóng góp ý kiến; để nhanh chóng chia sẻ rủi ro/vấn đề cũng như giải quyết chúng…
•	Cung cấp kết quả đầu ra với chất lượng, tốc độ, sự tuân thủ như mong đợi nhằm mang lại giá trị tốt nhất cho người dùng cuối của sản phẩm/dịch vụ
', CAST(2000 AS Decimal(18, 0)), 3, N'senior-nodejs-developer', N'5+ years of experience in software/web development
Excellent skills about JavaScript, NodeJS and VueJS; understanding Typescript is a big plus
Have considerable hands-on experience in designing API, DB, UI/UX
Understand about system architecture/framework design.
Can set up a variety of development environments
Have excellent skill in coding and handling a complex source code of large systems
Have hands-on experience in applying data modeling and algorithm
Solid skills in designing & performing UT/Implementing test code
Good at communication (verbal, non-verbal, writing)', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (26, N'Senior QC Engineer / Tester', N'Senior', 10, N'The software tester will work with our development team and be responsible for creating and executing test plans, test cases, and documenting software defects. This role is an integral part of our product development team and will work to ensure that our products meet the highest standards of quality and performance.', CAST(2000 AS Decimal(18, 0)), 4, N'senior-qc-tester', N'senior-qc-tester', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (27, N'Front-end Developer (Angular/AngularJS/JavaScript)', N'Senior', 1, N'Front-end Developer (Angular/AngularJS/JavaScript)', CAST(1000 AS Decimal(18, 0)), 6, N'front-end-developer-angular-angularjs-javascript', N'Have minimum 3 years of experience in Angular/AngularJS/JavaScript
Working efficiently remotely.', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (29, N'Backend Developer (PHP, MySQL, Laravel)', N'Middle', 3, N' Tham gia phát triển ứng dụng trên nền tảng PHP (Laravel) cho khách hàng Nhật Bản.
• Nhận chỉ thị công việc và mô tả thông số kỹ thuật trực tiếp từ khách hàng Nhật Bản thông qua các công cụ giao tiếp như Slack rồi tiến hành thiết kế, thực hiện và kiểm thử chức năng.
• Báo cáo kết quả định kì với team và leader.', CAST(1000 AS Decimal(18, 0)), 5, N'backend-developer-php-mysql-laravel', N'Trên 2 năm kinh nghiệm thực tế.
• Thành thạo lập trình với ngôn ngữ PHP/JavaScript/HTML 
• Có kinh nghiệm lập trình với 1 trong các framework PHP như Laravel, CakePHP, v.v 
• Có kiến thức tốt về database như MySQL, v.v
• Biết thiết kế database.
• Nắm bắt được các yêu cầu nghiệp vụ, có kinh nghiệm triển khai từ khâu thiết kế.  
• Nắm vững kiến thức về MVC, OOP. ', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [Job] ([id], [name], [levelJ], [quantity], [description], [salary], [categoryID], [meta], [detail], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [topHot], [numberView], [Tags]) VALUES (30, N'Software Quality Control (QA QC/Tester/DevOps)', N'Fresher', 4, N'Analyze requirements and design specifications.
Develop test strategies, test cases, test suites.
Develop the test estimation and test plan.
Ensure the quality of all software products.', CAST(0 AS Decimal(18, 0)), 4, N'software-quality-control-qa-qc-tester-devops', N'software-quality-control-qa-qc-tester-devops', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', NULL, NULL, NULL)
SET IDENTITY_INSERT [Job] OFF
GO
SET IDENTITY_INSERT [JobCategory] ON 

INSERT [JobCategory] ([id], [name], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome]) VALUES (3, N'Full-Stack', N'/full_stack', N'_fullstack', 0, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [JobCategory] ([id], [name], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome]) VALUES (4, N'Tester', N'/tester', N'_tester', 1, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [JobCategory] ([id], [name], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome]) VALUES (5, N'BackEnd', N'/back_end', N'_backend', 2, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [JobCategory] ([id], [name], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome]) VALUES (6, N'FrontEnd', N'/front_end', N'_frontend', 3, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [JobCategory] ([id], [name], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome]) VALUES (7, N'Business Analys', N'/business', N'_business_analys', 4, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [JobCategory] ([id], [name], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome]) VALUES (9, N'DevOps', N'/devops', N'_devops', 5, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [JobCategory] ([id], [name], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome]) VALUES (13, N'Project Manager', N'/project_manager', N'_project_manager', 6, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [JobCategory] ([id], [name], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome]) VALUES (14, N'Moblie Developer', N'/moblie_developer', N'_moblie_developer', 7, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0)
INSERT [JobCategory] ([id], [name], [link], [meta], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [showOnHome]) VALUES (15, N'QA/QC', N'/qa_qc', N'_qa_qc', 8, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', 0)
SET IDENTITY_INSERT [JobCategory] OFF
GO
SET IDENTITY_INSERT [Menu] ON 

INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (3, N'Trang chủ', N'/home', N'_home', N'admin', 0, 1, NULL, CAST(N'2023-02-20T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-20T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (6, N'Thông tin ', N'/about', N'_about', N'admin', 1, 1, NULL, CAST(N'2023-02-20T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-20T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (10, N'Công ty', N'/company', N'_company', N'admin', 2, 1, NULL, CAST(N'2023-02-20T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-20T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (12, N'Blog', N'/blog', N'_blog', N'admin', 4, 1, NULL, CAST(N'2023-02-20T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-20T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (14, N'Chuyện IT', N'/story', N'_story', N'admin', 5, 1, NULL, CAST(N'2023-02-20T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-20T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (15, N'Đăng ký', N'/register', N'_register', N'admin', 6, 1, NULL, CAST(N'2023-02-20T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-20T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (16, N'Đăng nhập', N'/login', N'_login', N'admin', 7, 1, NULL, CAST(N'2023-02-20T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-20T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (17, N'Công việc', N'/job', N'_job', N'admin', 3, 1, NULL, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (18, N'FullStack', N'/job/_fullstack', N'_job_fullstack', N'admin', 8, 1, 17, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (19, N'FrontEnd', N'/job/_frontend', N'_job_fronend', N'admin', 9, 1, 17, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (20, N'BackEnd', N'/job/_backend', N'_job_backend', N'admin', 10, 1, 17, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (22, N'TestTer', N'/job/_tester', N'_job_tester', N'admin', 11, 1, 17, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (23, N'Business Analys', N'/job/_business_analys', N'_job_business', N'admin', 12, 1, 17, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (24, N'DevOps', N'/job/_devops', N'_job_devops', N'admin', 13, 1, 17, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (26, N'Project Manager', N'/job/_project_manager', N'_job_project_manager', N'admin', 14, 1, 17, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (27, N'Moblie Developer', N'/job/_moblie_developer', N'_job_moblie_developer', N'admin', 15, 1, 17, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
INSERT [Menu] ([id], [name], [link], [meta], [modifedBy], [displayOrder], [hide], [inner_menu], [dateBegin], [createBy], [dateModife]) VALUES (28, N'QA/QC', N'/job/_qa_qc', N'_job_qa_qc', N'admin', 16, 1, 17, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [Menu] OFF
GO
SET IDENTITY_INSERT [Slide] ON 

INSERT [Slide] ([id], [img], [displayOrder], [link], [description], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [title]) VALUES (1, NULL, 0, NULL, N'Ở đây các bạn có thể tìm thấy tất cả các công việc mà nhà tuyển dụng đã đăng tải', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', N'Công việc')
INSERT [Slide] ([id], [img], [displayOrder], [link], [description], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [title]) VALUES (2, NULL, 1, NULL, N'Ở đây có những công ty IT khác nhau đang hoạt động trên khắp mọi miền đất nước', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', N'Công ty IT')
INSERT [Slide] ([id], [img], [displayOrder], [link], [description], [hide], [dateBegin], [createBy], [dateModife], [modifedBy], [title]) VALUES (3, NULL, 3, NULL, N'Ở đây có những CV mẫu cho các bạn tham khảo', 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', N'CV')
SET IDENTITY_INSERT [Slide] OFF
GO
SET IDENTITY_INSERT [Story] ON 

INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (1, N'_minh-da-bat-dau-nghe-ui-ux-design-nhu-the-nao', N'Mình đã bắt đầu nghề UI/UX Design như thế nào?', N'Chuyện là mình không biết có ai tham gia cuộc thi này dám tự nhận mình là “out trình”. Hẳn mọi người luôn có một mục tiêu, đích đến cho “trình” ngày một cao hơn, muốn “out” cũng khó. Mình chắc cũng thế thôi, nhưng ai mà chẳng có chuyện gì đó để kể nhỉ.

 

Bạn có biết có tới 4 dạng hiển thị số chỉ với một loại typeface, và mỗi dạng lại có chức năng riêng không? Hoặc, bạn đã từng nghĩ vị trí đặt một nút bấm lại ảnh hưởng đến tỉ lệ bấm vào của người sử dụng. Ok, nôm na những thứ đó là công việc của mình.

Mình bắt đầu là một UI/UX Designer cách đây khoảng 5 năm.

 

Ừ thì bây giờ mọi người thường tách UI (user interface) và UX (user experience) ra riêng cùng với rất nhiều định nghĩa (đôi khi với cả hình ảnh chai tương cà kinh điển). 

 

Mình thì thích xem bản thân là một trong những người tạo ra sản phẩm hơn, bất kể vị trí của mình là gì.

Ra trường với tấm bằng Marketing, thực sự mình không biết phải làm gì. Mình thích mấy thứ tỉ mỉ, mà thực ra trên đời có nhiều thứ cần tỉ mỉ lắm. Mình đã từng thử làm nhân viên PR của một nhà sách (tất nhiên là đòi hỏi sự tỉ mỉ) đến viết lách cho một vài ấn phẩm (yêu cầu gấp đôi sự tỉ mỉ). Và kết cục là một chuỗi ngày dài mông lung trong hoàn cảnh thất nghiệp.

 

Rồi một số chuyện diễn ra, rồi mình kiếm được công việc design đầu tiên tại một công ty phần mềm ở quận 5. Rồi công việc thứ 2, thứ 3 ở những công ty khác. Mình phát hiện ra rằng mình thích làm việc phối hợp với người khác hơn bản thân mình nghĩ.

 

Mình cũng thích đóng góp những giá trị cụ thể cho team, thích chia sẻ, thích nghiên cứu những điều mới mẻ trong công việc. Và trên hết mình biết rằng luôn có một nơi nào đó cần kĩ năng của mình.

Chuyện biết mình có thể làm được gì đó, và kĩ năng của mình có ích cho một vị trí ngoài kia, nói ra có vẻ buồn cười, nhưng là một cột mốc quan trọng đối với mình. Ai cũng có thể dễ dàng nói với bạn dừng suy nghĩ tiêu cực, hãy cố gắng. Nhưng chỉ có bạn mới biết những cảm giác ấy thực sự như thế nào. Giống như sếp cũ của mình từng nói: sự tôn trọng, cũng như lòng tự tin, là thứ phải tự gây dựng lấy, không ai có thể cho không mình cả.

Ừ thì mình đã bắt đầu công việc design của mình như thế. Với mình làm design là một nghề nghiệp để kiếm sống và cần phải thực hiện một cách nghiêm túc. Sau này, có điều kiện đứng lớp, mình hay chia sẻ với mọi người: đừng tự giới hạn công việc của mình chỉ ở mức vẽ ra bản thiết kế. Vai trò của Designer phải gắn với sản phẩm từ khi bắt đầu cho đến khi launch sản phẩm.', 0, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (4, N'neu-ban-dam-dan-than-nganh-it-luon-luon-co-nhung-vi-tri-xung-dang-cho-ban', N'Nếu bạn dám dấn thân ngành IT luôn luôn có những vị trí xứng đáng cho bạn', N'Với riêng cá nhân tôi, Dev/Tester họ đều là những người lính tiên phong cho mặt trận đổi mới và sáng tạo trong chuyển đổi số, có thể tạo ra những sản phẩm công nghệ không chỉ đem lại lợi ích trực tiếp và tăng năng lực cạnh tranh cho doanh nghiệp vươn ra toàn cầu, mà còn thúc đẩy sự tiến bộ của toàn xã hội. 

 

Sinh ra tại Hà Nội, học tập chuyên ngành điều khiển tự động hóa tại Đại học CNTT truyền thông Thái Nguyên, tôi đã từng nếm trải đủ những khó khăn và thách thức, cả những thất bại và thành công từ một người không được đào tạo bài bản để trở thành một lập trình viên chuyên nghiệp. 

Cách đây 8 năm
Tôi bắt đầu bén duyên với nghề IT cho một công ty nhỏ. Lúc đó tôi vẫn còn là sinh viên năm cuối và phải trả nợ môn để tốt nghiệp. May mắn tôi có những khởi đầu thuận lợi với vị trí Dev tại một công ty Nhật. Nhưng thấm thoát đã gần 3 năm sau khi rời công ty Nhật, với rất nhiều lần rẽ ngang sang những ngành khác như kinh doanh, đầu tư tài chính, bán hàng, phát triển bản thân, tôi nhận ra làm IT mới là ngành có thể giúp tôi nuôi sống bản thân mình. 

 

Năm 2019

Tôi xin vào làm việc tại công ty IT của Việt Nam với thu nhập chỉ bằng mức lương cơ bản của công ty Nhật vào năm 2015. 

 

Điều tồi tệ nhất xảy ra khi Covid làm mọi thứ đảo lộn. Công ty trở nên khó khăn về việc làm, tôi phải học những kiến thức hoàn toàn mới trong 2 tuần để bắt đầu một vị trí công việc mới. Đó là một thử thách mà tôi đã không vượt qua. 

Tôi chính thức bị thất nghiệp
…và nhận trợ cấp BHXH với số tiền 2.2 triệu/ tháng. Đây thật sự là một cú sốc, nhưng điều đáng sợ hơn là tôi có thể bị loại khỏi thị trường lao động. Ở nhà 6 tháng, dùng những đồng tiền trợ cấp cuối cùng để tham gia khóa học IT ở trường đại học Funix, cập nhật kiến thức mới để sớm quay lại làm việc. 

Vào tháng 6/2021 là lúc đỉnh dịch Covid mạnh nhất, giãn cách xã hội khắp nơi, tình trạng thất nghiệp báo động, nhiều doanh nghiệp phá sản, khi đó tôi nộp khoảng 20 CV nhưng chỉ có 4 công ty mời tôi đi phỏng vấn xin việc. 

Cú lội ngược dòng
Nhận được 2 offer lương và bén duyên với vị trí Software Tester tại công ty BGSV với mức lương cơ bản cao gấp 7 lần trước đây, đó thật sự là một cú lội ngược dòng. Thử thách của một người 32 tuổi đi xin việc bị 17 lần từ chối là một trải nghiệm có lẽ khiến tôi trưởng thành hơn rất nhiều. ', 1, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (5, N'khi-muon-dung-lai-hay-nghi-ve-luc-bat-dau', N'Khi muốn dừng lại, hãy nghĩ về lúc bắt đầu', N'Xin chào, tôi là Trọng – Software Solution Consultant. Tôi chưa “Out trình” nhưng vẫn muốn chia sẻ câu chuyện của tôi với mọi người, hi vọng góp được một ít giá trị cho cộng đồng. 

Tôi bắt đầu sự nghiệp trong ngành phần mềm vào đầu năm 2020, lúc đó vẫn là một cậu sinh viên năm thứ 3 Đại học, chập chững vào nghề với một kết quả học tập trung bình. Thời điểm đó kỹ năng lập trình của tôi gần như là con số 0. 

Bắt đầu sự nghiệp
Tôi đã tự học thêm một số ngôn ngữ lập trình nhưng lúc đó tôi lại bị mất phương hướng, cứ thấy công nghệ nào đang “hot” thì lao vào học. Học được vài ngày lại bỏ ngang. Tôi đã rất căng thẳng và áp lực. 

“Nếu cứ như thế này thì khi nào mới có được công việc? Có khi nào mình phải từ bỏ ở đây không? Hay là tìm công việc nào đó đơn giản hơn?…” Đó là những câu hỏi lặp đi lặp lại trong đầu tôi mỗi phút mỗi giây trong vòng hơn 2 tháng. 

Trong thời gian đó, tôi vẫn đi làm thêm bằng việc chạy xe ôm công nghệ. Và rất may mắn là tôi đã gặp được một số vị khách, tuy xa lạ nhưng đã có những phút trải lòng làm tôi phải thay đổi. Những chuyến xe đưa đón khách ở văn phòng, các tụ điểm giải trí với những câu chuyện buồn vui sau giờ làm việc được họ tâm sự với tôi. Thực sự tôi đã được mở mang đầu óc, từ trước đến nay những công việc mình nghĩ là đơn giản hóa ra chỉ là bề nổi. 

Từ những câu chuyện ngắn ngủi đó, tôi nhận ra không có công việc nào là nhẹ nhàng cả. Muốn đạt được điều mình muốn thì cần phải học hỏi và cố gắng từng ngày. 

Có thể nghe rất đơn giản, nhưng khi bạn được trải qua cảm giác của tôi lúc đó, được chính tai nghe thấy những câu chuyện của họ, được tận mắt thấy nét mặt và dáng vẻ mệt mỏi của họ bạn sẽ hiểu sâu sắc những điều trên.
Nó làm tôi quyết tâm hơn trên con đường nghề nghiệp
Tự hứa với bản thân sẽ cố gắng hơn, và không còn mất phương hướng nữa. Sau khoảng thời gian đó, tôi bắt đầu nghiêm túc trong việc học và tìm công việc. Cuối cùng cũng tìm được công việc thực tập đầu tiên sau hơn mười lần bị từ chối. Và bây giờ là lập trình viên ở một công ty đa quốc gia.
Cuối cùng, tôi muốn tổng kết lại một số cách bản thân mình đã áp dụng để giúp các bạn có thể bắt đầu sự nghiệp một cách trơn tru hơn. 

– Một là, chuẩn bị cho mình những kiến thức cơ bản nhất của ngành bạn muốn theo đuổi. Nếu chưa xác định được ngành cụ thể, bạn có thể thử và làm lại. 

– Hai là, tô điểm cho CV của bạn bằng việc thực hiện những dự án cá nhân hoặc nghiên cứu sâu về học thuật. 

– Và đặc biệt: chuẩn bị cho mình một tinh thần cầu tiến. Sẵn sàng đối mặt với khó khăn. Nếu muốn từ bỏ, bạn có thể từ bỏ, nhưng đừng từ bỏ khi chưa cố gắng hết khả năng. 

 

Tôi tin mỗi người trong chúng ta ai cũng có những điểm mạnh và ý chí của riêng mình. Tôi đã vượt qua được, bạn cũng có thể. Hãy luôn giữ cho mình tinh thần của ngày bắt đầu bạn nhé.', 2, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (7, N'tieng-anh-cua-dev-voi-nhung-cu-soc-dau-doi', N'Tiếng Anh của Dev với những cú sốc đầu đời', N'Sau khi ra trường, công ty đầu tiên tôi làm việc là một công ty của Mỹ ở Việt Nam. Sau gần 3 năm lăn lộn xông pha với các dự án lớn có nhỏ có, tiếp xúc với tiếng Anh của Mỹ có, Nhật có, tôi đã nghĩ rằng lông cánh mình đủ dài rồi, lâu lâu có thể nói chuyện xã giao với một vài khách hàng khá ổn, đọc hiểu yêu cầu, viết email trả lời khách hàng có vẻ chuyên nghiệp lắm. Có dear đầu thư, grammar chuẩn chỉnh. 

 

Nhưng rồi tôi đã lầm to.
Ngày tôi dứt áo ra đi, với tâm thế sẽ làm việc cho công ty nước ngoài, với mong ước một môi trường “only speaking English” để phát triển cũng như thi triển trình độ của mình, nên tôi đã đầu quân cho công ty có trụ sở tại Singapore. 

Ngày đầu tiên qua Sing
Sếp CTO đã nói tôi tham dự cuộc họp đầu tiên để biết thêm về công ty cũng như hiểu văn hóa họp hành bên này. Ổng ngồi gần màn hình, mọi người hướng mắt về ông để lắng nghe vấn đề ông đưa ra, tôi cũng thế, tập trung lắm vì có vẻ cảm nhận được độ khó rồi.

 

Ông CTO nói liên thanh, ổng người Hà Lan, nãy tôi gặp lúc mới vào công ty rồi, nhưng sao giờ khó nghe thế. Chêm thêm vài thuật ngữ tôi chưa từng có trong từ điển 3 năm kinh nghiệm trong ngành. 

Tôi bắt đầu toát mồ hôi, ráng lắm mới hiểu, đại khái là các team đang muốn xây dựng chung một format ghi log file để một hệ thống sẽ đọc và phân tích. Tôi cũng chẳng quan tâm lợi ích để làm gì, phải ráng hiểu ổng nói gì cái đã. Mặt tôi còn đang ngơ ngác, lâu lâu cau mày không hiểu thì lần lượt có mấy người đóng góp ý kiến. 

 

Một ông người Ấn đứng gần tôi cất tiếng… Mất mấy giây, tôi không biết, nhưng tôi hoang mang lắm, tôi không hiểu gì cả. “Ủa ổng đang nói tiếng Ấn hả, sao mọi người hiểu? Không! Mình nghe có chữ but I `tink` mà”. 
Rồi thêm người nữa cách tôi chẳng xa tiếp chuyện. Tôi đơ tập 2, không hiểu gì cả, họ nói cái quái gì vậy, và tôi biết một điều chắc chắn rằng hắn – hắn là người Trung Quốc, tôi nghe là biết, nãy giờ nói như trên mấy phim chưởng tôi hay xem hồi nhỏ này. 

 

Cứ như vậy, suốt cuộc họp có thêm vài giọng nữa góp vui, mà sau cuộc họp tôi được biết họ đến từ rất nhiều quốc gia khác nhau, Mã Lai có, Indo có, Ireland, và cả Nga nữa.

 

Phải rồi, tôi nhớ lúc phỏng vấn và cả trong mô tả công việc cũng có nói rằng công ty đa văn hóa, môi trường đa quốc gia, hơn 15 quốc tịch được mô tả trong phần “Cái Lợi” khi làm việc tại công ty. Thấy vậy mà chẳng phải vậy, tôi thầm nghĩ, đây là điểm trừ ấy chứ.

Vậy là 2 tuần bên Singapore không như tôi từng mơ
Tâm trạng không vui hòa vào những xa lạ ngày đầu khiến tôi thấy sợ và dần cảm nhận được cái khó khăn mà tôi đang vấp phải. 

 

Ngày cuối chia tay mọi người ở Singapore, chúng tôi ra một quán bia nhỏ ven đường, uống chút đỉnh xả stress ngày cuối tuần, mà sao tôi không thấy xả chút nào. Hơn chục người đi cùng tôi hầu hết là người Hoa, hoặc Sing gốc Hoa, thường thì trên công ty nói về công việc chậm rãi đã khó nghe rồi, nhưng khi nói chuyện phiếm, nói chuyện đùa trên trời dưới đất thì ngay lúc này đây, tôi mới hiểu rằng, chỉ còn một cách thôi: Mình phải “master English”.', 3, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (9, N'hanh-trinh-tim-duoc-huong-di-dung-co-that-su-de-dang-hay-khong', N'Hành trình tìm được hướng đi đúng có thật sự dễ dàng hay không?', N'Năm mình 18 tuổi mê crush học công nghệ thông tin nên mình cũng đi học theo với cái đầu rỗng.

 

Năm 1 được làm quen với máy tính, với những bài toán cao cấp và những dòng code thiếu nhi cơ bản. 

 

Năm 2 mấu chốt chính là vấp phải 4 cái đồ án lập trình: chuyên ngành, lập trình web, phân tích hệ thống, javascript. Ôi trời! Mình làm gì biết code, chưa từng code chạy bất kì thứ gì ngoài chu vi và diện tích tam giác. Làm 4 cái đồ án như vậy thì chắc chắn mình biết ngày tàn tới rồi. Năm 2 chắc có nhiều bạn cũng có suy nghĩ bỏ học do nợ môn, do mông lung. Kỳ đó mình rớt liên tục 5 môn, cộng thêm bốn quả đồ án, gia đình không đủ kinh phí. 

 

Và…mình quyết định nghỉ học, làm hồ sơ bảo lưu nhưng chưa kí, cơ duyên nào đó mình trở lại trường sau một tuần nghỉ học. 

Trong một đêm thức khuya nghĩ về cuộc sống và việc học, mình đi dạo các group sinh viên vô tình quen được một bạn. Đến bây giờ bạn ấy đã là người yêu mình. Chính bạn ấy đã mang lại cho mình nguồn động lực cực lớn mặc dù bạn ấy không hề khuyên bảo hay tư vấn định hướng gì cả. Bạn ấy giúp mình hoàn thành hai đồ án web, có lẽ trong một lần vô tình bạn ấy nhắc đến tester và bảo mình xem thử. Mình cũng mặc kệ, việc trước mắt của mình là qua môn và ra trường làm trái ngành chứ mình không thích nghề văn phòng này. 

 

Một hôm chán chán bạn ấy bảo mình lên Utest học Testing trên đó xem thế nào, nó kiếm được tiền đó. Thế là hứng lên học, tự học hết các khóa trên đó, tự tin log bugs chuyên nghiệp nhảy qua TestIO kiếm thêm. 
Trong suốt sáu tháng, mình yêu công việc log bugs từ khi nào không hay. Hai nền tảng này mang lại thu nhập khá ổn cho một sinh viên năm ba lúc đó như mình. Thế là mình kiếm tiền freelance trong lúc việc học đang tạm hoãn vì phải đi thực tập. 

 

Mình từng bị fail 5 chỗ vì chưa có kinh nghiệm thực chiến tại office. Đến công ty thứ 5 may sao họ nhận, vào làm việc 200% một ngày, không dám đi vệ sinh vì trễ giờ, trễ dealine các bác ơi. Nhờ họ bóc lột mình như vậy, mình lên kinh nghiệm và kĩ năng rất nhanh. Kinh nghiệm được một xíu là hoàn thành thực tập và chính thức tốt nghiệp đúng hạn, đi làm đúng ngành. 

 

Nhưng mình nhảy rất nhiều công ty, trong một năm mình làm bốn công ty, đọc CV nhà tuyển dụng chắc cũng rén. Mình không đồng tình với việc làm nhiều mà trả lương ít, lương lậu không rõ ràng nên mình đổi công ty chứ cũng chẳng có gì to tát. 

 

Quan điểm của mình khi đi làm là mối quan hệ giữa bạn và công ty là win – win. Nếu cảm thấy không hợp hãy tránh làm khổ nhau dài lâu. 

Hiện tại mình đã tìm được một ngôi nhà đáng yêu cho công việc Tester Manual rồi. Không phải cứ nghỉ việc là bế tắc, là không tìm được việc nữa. Cửa này đóng cừa khác sẽ mở, còn trẻ ngại khó ngại khổ thì sao biết được mình ở đâu. ', 4, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (11, N'anh-it-va-cau-chuyen-tinh-khong-vien-man', N'Anh IT và câu chuyện tình không viên mãn
', N'Chuyện kể về một anh bạn nhát gái nhưng lại thầm thương một cô gái cùng lớp đã hơn 10 năm. Tình đơn phương, không dám nhìn thẳng mặt em, chỉ biết tự kỷ bên cái màn hình, trước mặt là cái profile Facebook của cô gái mà ảnh tương tư, nút “Kết bạn” còn không dám bấm, nút “Nhắn tin” thì lại càng không. Để rồi câu chuyện tình vụt đi đâu mất, để lại đây một anh lập trình viên bên cái màn hình ngồi kể lại câu chuyện của đời mình. 

Lần đầu gặp cô gái
Vào hôm đó, cái ngày mà anh bạn lần đầu gặp cô gái, khi mà 2 đứa còn chung lớp, anh đã đem lòng tương tư rồi, nhưng vì tự ti và luôn nghĩ mình không xứng nên chưa một lần nào anh ấy dám thổ lộ. Vì học lực ảnh chỉ ở mức khá nên năm sau cả 2 đã phải tách lớp, không còn được gặp cô, cơ hội cho anh lúc này cũng đã tiệm cận 0 rồi. 

 

Thế là vào một ngày, trong phòng Tin học, giờ giải lao, vô tình anh lướt thấy một nhân vật game (Yuna – FFX) với nét mặt phải nói 99% giống y như đúc với cô gái ấy, bất chấp mọi khó khăn, ảnh cũng setup thành công giả lập PS2 vào con máy Win7 1GB RAM của mình. Trình độ đọc hiểu tiếng Anh của anh lúc đó cũng như tỷ lệ thành công nếu anh tỏ tình vậy, tiệm cận 0, nên anh gặp rất nhiều khó khăn khi chơi, đến mức nghĩ rằng thế giới ảo cũng quá phũ phàng với mình. 
Chuyện kể về một anh bạn nhát gái nhưng lại thầm thương một cô gái cùng lớp đã hơn 10 năm. Tình đơn phương, không dám nhìn thẳng mặt em, chỉ biết tự kỷ bên cái màn hình, trước mặt là cái profile Facebook của cô gái mà ảnh tương tư, nút “Kết bạn” còn không dám bấm, nút “Nhắn tin” thì lại càng không. Để rồi câu chuyện tình vụt đi đâu mất, để lại đây một anh lập trình viên bên cái màn hình ngồi kể lại câu chuyện của đời mình. 

Lần đầu gặp cô gái
Vào hôm đó, cái ngày mà anh bạn lần đầu gặp cô gái, khi mà 2 đứa còn chung lớp, anh đã đem lòng tương tư rồi, nhưng vì tự ti và luôn nghĩ mình không xứng nên chưa một lần nào anh ấy dám thổ lộ. Vì học lực ảnh chỉ ở mức khá nên năm sau cả 2 đã phải tách lớp, không còn được gặp cô, cơ hội cho anh lúc này cũng đã tiệm cận 0 rồi. 

 

Thế là vào một ngày, trong phòng Tin học, giờ giải lao, vô tình anh lướt thấy một nhân vật game (Yuna – FFX) với nét mặt phải nói 99% giống y như đúc với cô gái ấy, bất chấp mọi khó khăn, ảnh cũng setup thành công giả lập PS2 vào con máy Win7 1GB RAM của mình. Trình độ đọc hiểu tiếng Anh của anh lúc đó cũng như tỷ lệ thành công nếu anh tỏ tình vậy, tiệm cận 0, nên anh gặp rất nhiều khó khăn khi chơi, đến mức nghĩ rằng thế giới ảo cũng quá phũ phàng với mình. ', 5, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (12, N'hanh-trinh-tro-thanh-chuyen-gia-bao-mat-thong-tin', N'Hành trình trở thành chuyên gia bảo mật thông tin từ con số 0
', N'Từ một đứa thuộc dạng ngu ngơ với Công nghệ Thông tin (IT), tôi đã trở thành chuyên gia về bảo mật thông tin (infosec). Nhiều lúc tôi cứ nghĩ đó là một giấc mơ, nhưng giấc mơ đó là có thật.

 

Khi ra trường (tôi không chuyên về IT), tôi được một công ty start-up tuyển vào. Trong công ty, tôi làm đủ thứ công việc, từ HR, admin, dịch thuật, và cả hỗ trợ IT. Trình độ IT của tôi rất gà mờ, thế là tôi cố gắng “google search”. Mà tôi cũng không ngờ những kiến thức mình tìm kiếm được từ Google, tôi có thể hoàn thành nhiệm vụ hỗ trợ IT.



Từ một đứa thuộc dạng ngu ngơ với Công nghệ Thông tin (IT), tôi đã trở thành chuyên gia về bảo mật thông tin (infosec). Nhiều lúc tôi cứ nghĩ đó là một giấc mơ, nhưng giấc mơ đó là có thật.

 

Khi ra trường (tôi không chuyên về IT), tôi được một công ty start-up tuyển vào. Trong công ty, tôi làm đủ thứ công việc, từ HR, admin, dịch thuật, và cả hỗ trợ IT. Trình độ IT của tôi rất gà mờ, thế là tôi cố gắng “google search”. Mà tôi cũng không ngờ những kiến thức mình tìm kiếm được từ Google, tôi có thể hoàn thành nhiệm vụ hỗ trợ IT.



Từ một đứa thuộc dạng ngu ngơ với Công nghệ Thông tin (IT), tôi đã trở thành chuyên gia về bảo mật thông tin (infosec). Nhiều lúc tôi cứ nghĩ đó là một giấc mơ, nhưng giấc mơ đó là có thật.

 

Khi ra trường (tôi không chuyên về IT), tôi được một công ty start-up tuyển vào. Trong công ty, tôi làm đủ thứ công việc, từ HR, admin, dịch thuật, và cả hỗ trợ IT. Trình độ IT của tôi rất gà mờ, thế là tôi cố gắng “google search”. Mà tôi cũng không ngờ những kiến thức mình tìm kiếm được từ Google, tôi có thể hoàn thành nhiệm vụ hỗ trợ IT.', 6, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (13, N'van-la-day-mang-day-nhung-ma-no-la-lam', N'Vẫn là dây mạng đấy nhưng mà nó lạ lắm
', N'Chuyện là thế này, năm 2016 tôi ra trường và vào một công ty về viễn thông. Mới vào thì job chính của tôi là sửa mạng, bấm dây mạng và kết nối các thiết bị. Hồi đó tôi bấm dây mạng bấm 10 phải ăn 11. Hai năm sau, việc bấm dây mạng vẫn là top đầu vì cả tổ chỉ có tôi làm về mảng này còn lại anh em đều làm về Dev.

Một ngày, tổ của tôi có một người làm Dev mới về. Thường những người làm Dev trong tổ lúc đó chả ai biết về bấm dây mạng. Rồi đến lúc gặp người mới tôi nghĩ chắc cũng như thế. 

Đến khi bên tôi triển khai hệ thống cho một tổ viễn thông, ngồi bấm dây mạng nhiều quá thì người mới đó quay ra hỏi:

– Chú có cần giúp vài sợi không?

– Tôi ngạc nhiên trả lời: Ủa, anh làm dev mà cũng biết bấm dây mạng ư?

– Anh đó trả lời: Ừm anh cũng một thời phải đi bấm dây chú à.

 

Tôi thấy vậy cũng rất vui vẻ vì có người hỗ trợ. 

Trong lúc đang giúp anh đó hỏi vui:

– Nếu giờ anh bấm 2 đầu dây không theo chuẩn A hay B của chú thì chú nghĩ có được không?

– Tôi cười trừ: Tất nhiên là không được rồi anh.

– Anh đó hỏi lại: Chú chắc chứ, hay làm cái độ nhỉ, 50k thôi.

 

Có một người định cá độ với Top 1 bấm dây mạng của công ty. Tôi rất tự tin phần thắng nắm trong tay 99%, rồi trả lời: Ok thôi anh.

 

Anh ấy bấm một đầu là: Cam, xanh, xanh lá, nâu, trắng cam, trắng xanh, trắng xanh lá, trắng nâu, và đầu kia cũng vậy. Rồi anh ấy cắm Laptop dây vừa bấm đó vào và thế là … Internet Connected. 

 

Tôi không hiểu chuyện gì xảy ra, 12 năm đi học 4 năm cao đẳng vứt xuống sông xuống biển. Anh em trong tổ nhìn tôi và phì ra cười, tôi đã mất 50k.


Sau đó, tôi ở tại công ty đó một năm nữa rồi sang công ty khác. Sang nơi mới toàn anh em trẻ nên rất nhiệt huyết. Làm tại công ty mới hết hai tháng thử việc tôi được vào dự án triển khai hạ tầng mạng. Tôi nhận job rồi cũng thực hiện các kế hoạch triển khai để hoàn thành được job. 

 

Đến một buổi tối triển khai, hôm đó phải bấm dây nhảy cho tủ mạng. Ngồi làm cùng với mấy anh em trong nhóm bấm 3-400 dây nhảy nên chia ra. Làm lâu lâu mọi người cũng mệt cũng chán, tôi ngồi lúc đó tự nhiên chợt nhớ lại cái 50k. Thử đổi không khí của anh em trong nhóm chút, tôi liền bảo:

– Chán nhỉ, anh em làm cái độ không?

– Mọi người hỏi: Độ gì thế chú?

 

Vẫn câu đố hồi đó, anh em trong nhóm trả lời:

– Không được đâu. Làm sao có chuyện đó được, anh định làm siêu nhân à?

– Tôi liền bảo: Thôi giờ ai độ thì 50k, em nhận hết.

Mọi người đều OK.

 

Tôi bắt đầu bấm, lần này chơi hẳn một kiểu khác lạ nhưng dây hai đầu đều giống nhau và rồi … Internet Connected. Mọi người cũng mắt to mắt tròn nhìn tôi, tôi đang chuẩn bị phì ra cười thì có một tiếng nói phía sau: Chắc gì được nổi 1Gbps. Tôi đưa ra vẫn là 1Gbps. Ai cũng ngơ ngác không hiểu vì sao.

 

Tôi vừa cười vừa nhìn từng người rút 50k đưa cho mình.

Sau tất cả đúc kết lại. Dây mạng thì cũng là dây điện mà thôi. Quan trọng hiểu nó như thế nào.

 

Tôi không khuyến khích anh em bấm theo tôi mà tôi chỉ muốn đưa ra một bài học là cần nắm vững từ lý thuyết, hiểu rõ bản chất và bạn có thể làm việc đó rất tốt, đôi khi sẽ có cả sáng tạo trong công việc.', 7, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (15, N'tu-nghien-game-den-nghien-code', N'Từ nghiện game đến nghiện code', N'Những năm tháng chập chững bước chân lên đại học với tôi là chuỗi ngày vô cùng tồi tệ. Sự tự hào về thành tích trúng tuyển Đại học, một môi trường mới, con người mới, cùng tư duy “Đại học là để hưởng thụ” đã biến tôi thành một đứa nghiện game từ lúc nào.

 

Kết quả là cuối kỳ sau năm Nhất, lần đầu tiên – tôi trượt môn. Nhưng tôi không quan tâm, cuộc sống ảo làm tôi thoải mái. Tôi chính thức bỏ bê việc học.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.

 

Thành tích học tập cải thiện, khiến tôi càng có động lực hơn để hăng say với việc quyết tâm trả nợ hết môn. Tôi “cày” gần 40 tín chỉ một kỳ, cả ngày học ở trường, tối tới lớp luyện lập trình…hôm nào cũng đến đêm mới về nhà.

 

Thời gian đó, tôi bắt đầu có những mục tiêu, những ý tưởng, sự lạc quan để làm việc, hình thành niềm đam mê của mình.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.

 

Thành tích học tập cải thiện, khiến tôi càng có động lực hơn để hăng say với việc quyết tâm trả nợ hết môn. Tôi “cày” gần 40 tín chỉ một kỳ, cả ngày học ở trường, tối tới lớp luyện lập trình…hôm nào cũng đến đêm mới về nhà.

 

Thời gian đó, tôi bắt đầu có những mục tiêu, những ý tưởng, sự lạc quan để làm việc, hình thành niềm đam mê của mình.

Những năm tháng chập chững bước chân lên đại học với tôi là chuỗi ngày vô cùng tồi tệ. Sự tự hào về thành tích trúng tuyển Đại học, một môi trường mới, con người mới, cùng tư duy “Đại học là để hưởng thụ” đã biến tôi thành một đứa nghiện game từ lúc nào.

 

Kết quả là cuối kỳ sau năm Nhất, lần đầu tiên – tôi trượt môn. Nhưng tôi không quan tâm, cuộc sống ảo làm tôi thoải mái. Tôi chính thức bỏ bê việc học.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.

 

Thành tích học tập cải thiện, khiến tôi càng có động lực hơn để hăng say với việc quyết tâm trả nợ hết môn. Tôi “cày” gần 40 tín chỉ một kỳ, cả ngày học ở trường, tối tới lớp luyện lập trình…hôm nào cũng đến đêm mới về nhà.

 

Thời gian đó, tôi bắt đầu có những mục tiêu, những ý tưởng, sự lạc quan để làm việc, hình thành niềm đam mê của mình.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.

 

Thành tích học tập cải thiện, khiến tôi càng có động lực hơn để hăng say với việc quyết tâm trả nợ hết môn. Tôi “cày” gần 40 tín chỉ một kỳ, cả ngày học ở trường, tối tới lớp luyện lập trình…hôm nào cũng đến đêm mới về nhà.

 

Thời gian đó, tôi bắt đầu có những mục tiêu, những ý tưởng, sự lạc quan để làm việc, hình thành niềm đam mê của mình.', 8, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (16, N'tu-nghien-game-den-nghien-code', N'Từ nghiện game đến nghiện code', N'Những năm tháng chập chững bước chân lên đại học với tôi là chuỗi ngày vô cùng tồi tệ. Sự tự hào về thành tích trúng tuyển Đại học, một môi trường mới, con người mới, cùng tư duy “Đại học là để hưởng thụ” đã biến tôi thành một đứa nghiện game từ lúc nào.

 

Kết quả là cuối kỳ sau năm Nhất, lần đầu tiên – tôi trượt môn. Nhưng tôi không quan tâm, cuộc sống ảo làm tôi thoải mái. Tôi chính thức bỏ bê việc học.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.

 

Thành tích học tập cải thiện, khiến tôi càng có động lực hơn để hăng say với việc quyết tâm trả nợ hết môn. Tôi “cày” gần 40 tín chỉ một kỳ, cả ngày học ở trường, tối tới lớp luyện lập trình…hôm nào cũng đến đêm mới về nhà.

 

Thời gian đó, tôi bắt đầu có những mục tiêu, những ý tưởng, sự lạc quan để làm việc, hình thành niềm đam mê của mình.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.

 

Thành tích học tập cải thiện, khiến tôi càng có động lực hơn để hăng say với việc quyết tâm trả nợ hết môn. Tôi “cày” gần 40 tín chỉ một kỳ, cả ngày học ở trường, tối tới lớp luyện lập trình…hôm nào cũng đến đêm mới về nhà.

 

Thời gian đó, tôi bắt đầu có những mục tiêu, những ý tưởng, sự lạc quan để làm việc, hình thành niềm đam mê của mình.

Những năm tháng chập chững bước chân lên đại học với tôi là chuỗi ngày vô cùng tồi tệ. Sự tự hào về thành tích trúng tuyển Đại học, một môi trường mới, con người mới, cùng tư duy “Đại học là để hưởng thụ” đã biến tôi thành một đứa nghiện game từ lúc nào.

 

Kết quả là cuối kỳ sau năm Nhất, lần đầu tiên – tôi trượt môn. Nhưng tôi không quan tâm, cuộc sống ảo làm tôi thoải mái. Tôi chính thức bỏ bê việc học.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.

 

Thành tích học tập cải thiện, khiến tôi càng có động lực hơn để hăng say với việc quyết tâm trả nợ hết môn. Tôi “cày” gần 40 tín chỉ một kỳ, cả ngày học ở trường, tối tới lớp luyện lập trình…hôm nào cũng đến đêm mới về nhà.

 

Thời gian đó, tôi bắt đầu có những mục tiêu, những ý tưởng, sự lạc quan để làm việc, hình thành niềm đam mê của mình.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.

 

Thành tích học tập cải thiện, khiến tôi càng có động lực hơn để hăng say với việc quyết tâm trả nợ hết môn. Tôi “cày” gần 40 tín chỉ một kỳ, cả ngày học ở trường, tối tới lớp luyện lập trình…hôm nào cũng đến đêm mới về nhà.

 

Thời gian đó, tôi bắt đầu có những mục tiêu, những ý tưởng, sự lạc quan để làm việc, hình thành niềm đam mê của mình.', 8, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
INSERT [Story] ([id], [meta], [title], [content_story], [displayOrder], [hide], [dateBegin], [createBy], [dateModife], [modifedBy]) VALUES (17, N'tu-nghien-game-den-nghien-code', N'Từ nghiện game đến nghiện code', N'Những năm tháng chập chững bước chân lên đại học với tôi là chuỗi ngày vô cùng tồi tệ. Sự tự hào về thành tích trúng tuyển Đại học, một môi trường mới, con người mới, cùng tư duy “Đại học là để hưởng thụ” đã biến tôi thành một đứa nghiện game từ lúc nào.

 

Kết quả là cuối kỳ sau năm Nhất, lần đầu tiên – tôi trượt môn. Nhưng tôi không quan tâm, cuộc sống ảo làm tôi thoải mái. Tôi chính thức bỏ bê việc học.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.

 

Thành tích học tập cải thiện, khiến tôi càng có động lực hơn để hăng say với việc quyết tâm trả nợ hết môn. Tôi “cày” gần 40 tín chỉ một kỳ, cả ngày học ở trường, tối tới lớp luyện lập trình…hôm nào cũng đến đêm mới về nhà.

 

Thời gian đó, tôi bắt đầu có những mục tiêu, những ý tưởng, sự lạc quan để làm việc, hình thành niềm đam mê của mình.

Cơ hội để thay đổi
Vào một ngày hè nắng nóng, lần đầu tiên tôi rời quán game và đi về lớp tham dự buổi tuyển sinh lớp lập trình của “tiền bối” trường Đại học Bách Khoa Hà Nội; và cũng không hiểu vì sao, tôi trúng tuyển. Anh chỉ dạy cho tôi từ con số 0, anh khiến tôi tôi càng hứng thú với chuyên ngành của mình. Nó không khô khan, không nhàm chán như tôi đã từng nghĩ, nó bổ ích hơn những trận game ngày trước và đã giúp tôi tìm được cơ hội để thay đổi.
', 8, 1, CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [Story] OFF
GO
ALTER TABLE [Blog] ADD  CONSTRAINT [DF_Blog_displayOrder]  DEFAULT ((0)) FOR [displayOrder]
GO
ALTER TABLE [Blog] ADD  CONSTRAINT [DF_Blog_hide]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [BlogCategory] ADD  CONSTRAINT [DF_BlogCategory_displayOrder]  DEFAULT ((0)) FOR [displayOrder]
GO
ALTER TABLE [BlogCategory] ADD  CONSTRAINT [DF_BlogCategory_hide]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [Company] ADD  CONSTRAINT [DF_Company_hide]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [Company] ADD  CONSTRAINT [DF_Company_showOnHome]  DEFAULT ((0)) FOR [showOnHome]
GO
ALTER TABLE [Company] ADD  CONSTRAINT [DF_Company_OT]  DEFAULT ((0)) FOR [OT]
GO
ALTER TABLE [Contact] ADD  CONSTRAINT [DF_Contact_status]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [Feedback] ADD  CONSTRAINT [DF_Feedback_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [Footer] ADD  CONSTRAINT [DF_Footer_hide]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [Footer] ADD  CONSTRAINT [DF_Footer_type]  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [Footer] ADD  CONSTRAINT [DF_Footer_columnIndex]  DEFAULT ((1)) FOR [columnIndex]
GO
ALTER TABLE [Job] ADD  CONSTRAINT [DF_Job_quantity]  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [Job] ADD  CONSTRAINT [DF_Job_hide]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [JobCategory] ADD  CONSTRAINT [DF_JobCategory_displayOrder]  DEFAULT ((0)) FOR [displayOrder]
GO
ALTER TABLE [JobCategory] ADD  CONSTRAINT [DF_JobCategory_hide]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [JobCategory] ADD  CONSTRAINT [DF_JobCategory_showOnHome]  DEFAULT ((0)) FOR [showOnHome]
GO
ALTER TABLE [Menu] ADD  CONSTRAINT [DF_Menu_displayOrder]  DEFAULT ((0)) FOR [displayOrder]
GO
ALTER TABLE [Menu] ADD  CONSTRAINT [DF_Menu_hide]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [Slide] ADD  CONSTRAINT [DF_Slide_displayOrder]  DEFAULT ((0)) FOR [displayOrder]
GO
ALTER TABLE [Slide] ADD  CONSTRAINT [DF_Slide_hide]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [Story] ADD  CONSTRAINT [DF_Story_displayOrder]  DEFAULT ((0)) FOR [displayOrder]
GO
ALTER TABLE [Story] ADD  CONSTRAINT [DF_Story_hide]  DEFAULT ((1)) FOR [hide]
GO
ALTER TABLE [UserApply] ADD  CONSTRAINT [DF_UserApply_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [UserApply] ADD  CONSTRAINT [DF_UserApply_Active]  DEFAULT ((1)) FOR [Active]
GO
