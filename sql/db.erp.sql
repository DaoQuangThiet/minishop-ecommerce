USE [master]
GO
/****** Object:  Database [ERP]    Script Date: 2/13/2023 12:07:19 PM ******/
CREATE DATABASE [ERP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ERP', FILENAME = N'D:\rdsdbdata\DATA\ERP.mdf' , SIZE = 51200KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'ERP_log', FILENAME = N'D:\rdsdbdata\DATA\ERP_log.ldf' , SIZE = 15104KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ERP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ERP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ERP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ERP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ERP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ERP] SET ARITHABORT OFF 
GO
ALTER DATABASE [ERP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ERP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ERP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ERP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ERP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ERP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ERP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ERP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ERP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ERP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ERP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ERP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ERP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ERP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ERP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ERP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ERP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ERP] SET RECOVERY FULL 
GO
ALTER DATABASE [ERP] SET  MULTI_USER 
GO
ALTER DATABASE [ERP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ERP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ERP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ERP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ERP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ERP] SET QUERY_STORE = OFF
GO
USE [ERP]
GO
/****** Object:  UserDefinedFunction [dbo].[Standardizing]    Script Date: 2/13/2023 12:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Standardizing] (
 @input nvarchar(max)
)
RETURNS varchar(max)
AS 
BEGIN
	DECLARE @count int;

	DECLARE @withaccents nvarchar(100);
	DECLARE @withoutaccents nvarchar(100);

	DECLARE @result nvarchar(max);
	SELECT @result = @input;

	-- ACCENTS
    SET @withaccents = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ';
    SET @withoutaccents = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyAADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOUUUUUUUUUUYYYYY';
    SET @count = LEN(@withaccents);

    WHILE (@count > 0)
	BEGIN
        SET @result = REPLACE(@result, SUBSTRING(@withaccents, @count, 1), SUBSTRING(@withoutaccents, @count, 1));
        SET @count = @count - 1;
	END

    RETURN LOWER(@result);
END
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[ActivityID] [uniqueidentifier] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[ServiceCode] [smallint] NOT NULL,
	[ActionCode] [smallint] NOT NULL,
	[StatusCode] [smallint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserTargetedID] [uniqueidentifier] NULL,
	[ClinicID] [uniqueidentifier] NULL,
	[TargetItemID] [uniqueidentifier] NULL,
	[Metadata] [ntext] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentID] [uniqueidentifier] NOT NULL,
	[TimeStart] [datetime] NOT NULL,
	[TimeEnd] [datetime] NOT NULL,
	[UserCreateID] [uniqueidentifier] NOT NULL,
	[UserAppointID] [uniqueidentifier] NULL,
	[ServiceID] [uniqueidentifier] NULL,
	[ClinicID] [uniqueidentifier] NULL,
	[SpecialPrice] [numeric](18, 2) NULL,
	[ChiefComplaint] [nvarchar](500) NULL,
	[ClinicalNote] [nvarchar](500) NULL,
	[ReferralID] [uniqueidentifier] NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset](
	[AssetID] [uniqueidentifier] NOT NULL,
	[AssetName] [nvarchar](250) NOT NULL,
	[AssetCode] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[StatusID] [tinyint] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [numeric](18, 2) NULL,
	[ClinicID] [uniqueidentifier] NOT NULL,
	[UserCreatedID] [uniqueidentifier] NOT NULL,
	[IsSale] [bit] NULL,
	[SaleDescription] [ntext] NULL,
 CONSTRAINT [PK_Asset] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetConfig]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetConfig](
	[AssetConfigID] [uniqueidentifier] NOT NULL,
	[AssetID] [uniqueidentifier] NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [numeric](18, 2) NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Description] [ntext] NULL,
	[ServiceID] [uniqueidentifier] NOT NULL,
	[UserCreatedID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AssetConfig] PRIMARY KEY CLUSTERED 
(
	[AssetConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetConsumed]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetConsumed](
	[AssetConsumedID] [uniqueidentifier] NOT NULL,
	[AssetID] [uniqueidentifier] NOT NULL,
	[Price] [numeric](18, 2) NULL,
	[Amount] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[Description] [ntext] NULL,
	[ServiceID] [uniqueidentifier] NOT NULL,
	[EpisodeID] [uniqueidentifier] NOT NULL,
	[UserCreatedID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AssetConsumed] PRIMARY KEY CLUSTERED 
(
	[AssetConsumedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetImported]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetImported](
	[AssetImportedID] [uniqueidentifier] NOT NULL,
	[AssetID] [uniqueidentifier] NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [numeric](18, 2) NULL,
	[Description] [ntext] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[UserCreatedID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AssetImported] PRIMARY KEY CLUSTERED 
(
	[AssetImportedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[AttachmentID] [uniqueidentifier] NOT NULL,
	[AttachmentUrl] [nvarchar](2500) NOT NULL,
	[AttachmentType] [tinyint] NOT NULL,
	[AttachmentName] [nvarchar](500) NULL,
	[TargetItemID] [uniqueidentifier] NOT NULL,
	[TargetItemType] [tinyint] NOT NULL,
	[ClinicID] [uniqueidentifier] NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[AttachmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [uniqueidentifier] NOT NULL,
	[CategoryName] [nvarchar](500) NOT NULL,
	[ClinicID] [uniqueidentifier] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryItem]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryItem](
	[CategoryItemID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[ItemType] [tinyint] NOT NULL,
 CONSTRAINT [PK_CategoryItem] PRIMARY KEY CLUSTERED 
(
	[CategoryItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Channel]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channel](
	[ChannelID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[PlatformType] [tinyint] NOT NULL,
	[Link] [nvarchar](250) NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[ChannelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic](
	[ClinicID] [uniqueidentifier] NOT NULL,
	[ClinicName] [nvarchar](150) NOT NULL,
	[ShortDescription] [nvarchar](250) NULL,
	[Logo] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[TaxNumber] [varchar](20) NULL,
	[Address] [nvarchar](250) NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
	[PublicStatus] [bit] NULL,
	[PublicNameUrl] [varchar](200) NULL,
 CONSTRAINT [PK_Clinic] PRIMARY KEY CLUSTERED 
(
	[ClinicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnosis](
	[DiagnosisID] [uniqueidentifier] NOT NULL,
	[DiseaseID] [uniqueidentifier] NOT NULL,
	[SummaryID] [uniqueidentifier] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[UserCreateID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[DiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disease]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disease](
	[DiseaseID] [uniqueidentifier] NOT NULL,
	[DiseaseName] [nvarchar](200) NOT NULL,
	[ICD10] [varchar](50) NULL,
	[StatusID] [tinyint] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Disease] PRIMARY KEY CLUSTERED 
(
	[DiseaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Episode]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Episode](
	[EpisodeID] [uniqueidentifier] NOT NULL,
	[AdmissionType] [tinyint] NOT NULL,
	[UserAdmittedID] [uniqueidentifier] NOT NULL,
	[TimeStart] [datetime] NOT NULL,
	[TimeEnd] [datetime] NULL,
	[AppointmentID] [uniqueidentifier] NULL,
	[ClinicID] [uniqueidentifier] NULL,
	[ReferralID] [uniqueidentifier] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
	[PublicTitle] [nvarchar](500) NULL,
	[PublicHeadline] [nvarchar](2500) NULL,
	[PublicStatus] [bit] NULL,
	[PublicNameUrl] [varchar](200) NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Episode] PRIMARY KEY CLUSTERED 
(
	[EpisodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [uniqueidentifier] NOT NULL,
	[InvoiceNumber] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[TotalPrice] [numeric](18, 2) NOT NULL,
	[DiscountPrice] [numeric](18, 2) NOT NULL,
	[FinalPrice] [numeric](18, 2) NOT NULL,
	[EpisodeID] [uniqueidentifier] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medication]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medication](
	[MedicationID] [uniqueidentifier] NOT NULL,
	[MedicineID] [uniqueidentifier] NOT NULL,
	[SummaryID] [uniqueidentifier] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[MedicineRoute] [smallint] NULL,
	[AmountPerDose] [smallint] NOT NULL,
	[UnitType] [smallint] NOT NULL,
	[DosePerDay] [smallint] NOT NULL,
	[DaysCount] [smallint] NOT NULL,
	[TotalUnitsCount] [smallint] NULL,
	[TotalBuyingNumber] [smallint] NULL,
	[BuyingUnit] [smallint] NULL,
	[Instruction] [nvarchar](2000) NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[UserCreateID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Medication] PRIMARY KEY CLUSTERED 
(
	[MedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[MedicineID] [uniqueidentifier] NOT NULL,
	[MedicineName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[DefaultMedRoute] [smallint] NULL,
	[DefaultUsageNum] [smallint] NULL,
	[UnitType] [smallint] NOT NULL,
	[DefaultDosePerDay] [smallint] NULL,
	[DefaultAmountPerDose] [smallint] NULL,
	[DefaultBuyingNumber] [smallint] NULL,
	[DefaultBuyingUnit] [smallint] NULL,
	[StatusID] [tinyint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[ServiceID] [uniqueidentifier] NOT NULL,
	[ClinicID] [uniqueidentifier] NULL,
	[SpecialPrice] [numeric](18, 2) NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Record]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Record](
	[RecordID] [uniqueidentifier] NOT NULL,
	[EpisodeID] [uniqueidentifier] NOT NULL,
	[TimeStart] [datetime] NULL,
	[TimeEnd] [datetime] NULL,
	[UserAppointID] [uniqueidentifier] NOT NULL,
	[ServiceID] [uniqueidentifier] NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[IsFree] [bit] NOT NULL,
	[ClinicalResult] [ntext] NULL,
	[InvoiceID] [uniqueidentifier] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
	[DoctorNote] [ntext] NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referral]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referral](
	[ReferralID] [uniqueidentifier] NOT NULL,
	[SummaryID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[ServiceID] [uniqueidentifier] NULL,
	[ClinicID] [uniqueidentifier] NULL,
	[SpecialPrice] [numeric](18, 2) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[UserCreateID] [uniqueidentifier] NOT NULL,
	[UserAppointID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Referral] PRIMARY KEY CLUSTERED 
(
	[ReferralID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relative]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relative](
	[RelativeID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[UserRelativeID] [uniqueidentifier] NOT NULL,
	[RelativeType] [tinyint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Relative] PRIMARY KEY CLUSTERED 
(
	[RelativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[ClinicID] [uniqueidentifier] NOT NULL,
	[RoleType] [tinyint] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[ProfileUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [uniqueidentifier] NOT NULL,
	[ClinicID] [uniqueidentifier] NULL,
	[UserID] [uniqueidentifier] NULL,
	[TimeStart] [smallint] NOT NULL,
	[TimeEnd] [smallint] NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [uniqueidentifier] NOT NULL,
	[ServiceName] [nvarchar](150) NOT NULL,
	[ClinicID] [uniqueidentifier] NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[ShortDescription] [ntext] NULL,
	[Logo] [varchar](250) NULL,
	[ParentServiceID] [uniqueidentifier] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
	[IsSaleOrder] [bit] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Summary]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Summary](
	[SummaryID] [uniqueidentifier] NOT NULL,
	[EpisodeID] [uniqueidentifier] NOT NULL,
	[DischargeType] [tinyint] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Summary] PRIMARY KEY CLUSTERED 
(
	[SummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/13/2023 12:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[GenderType] [bit] NULL,
	[Dob] [date] NULL,
	[Avatar] [varchar](250) NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](50) NULL,
	[IdentityID] [varchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Occupation] [nvarchar](150) NULL,
	[Country] [nvarchar](150) NULL,
	[Password] [nvarchar](50) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[StatusID] [tinyint] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_ActivityID]  DEFAULT (newid()) FOR [ActivityID]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_ServiceCode]  DEFAULT ((0)) FOR [ServiceCode]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_ServiceCode1]  DEFAULT ((0)) FOR [ActionCode]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_StatusCode]  DEFAULT ((0)) FOR [StatusCode]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_Metadata]  DEFAULT ('{}') FOR [Metadata]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_AppointmentID]  DEFAULT (newid()) FOR [AppointmentID]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Asset] ADD  CONSTRAINT [DF_Asset_AssetID]  DEFAULT (newid()) FOR [AssetID]
GO
ALTER TABLE [dbo].[Asset] ADD  CONSTRAINT [DF_Asset_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Asset] ADD  CONSTRAINT [DF_Asset_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Asset] ADD  CONSTRAINT [DF_Asset_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Asset] ADD  CONSTRAINT [DF_Asset_Type]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[Asset] ADD  CONSTRAINT [DF_Asset_Amount]  DEFAULT ((1)) FOR [Amount]
GO
ALTER TABLE [dbo].[AssetConfig] ADD  CONSTRAINT [DF_AssetConfig_AssetConfigID]  DEFAULT (newid()) FOR [AssetConfigID]
GO
ALTER TABLE [dbo].[AssetConfig] ADD  CONSTRAINT [DF_AssetConfig_Amount]  DEFAULT ((1)) FOR [Amount]
GO
ALTER TABLE [dbo].[AssetConfig] ADD  CONSTRAINT [DF_AssetConfig_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[AssetConfig] ADD  CONSTRAINT [DF_AssetConfig_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[AssetConsumed] ADD  CONSTRAINT [DF_AssetConsumed_AssetConsumedID]  DEFAULT (newid()) FOR [AssetConsumedID]
GO
ALTER TABLE [dbo].[AssetConsumed] ADD  CONSTRAINT [DF_AssetConsumed_Amount]  DEFAULT ((1)) FOR [Amount]
GO
ALTER TABLE [dbo].[AssetConsumed] ADD  CONSTRAINT [DF_AssetConsumed_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[AssetConsumed] ADD  CONSTRAINT [DF_AssetConsumed_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[AssetImported] ADD  CONSTRAINT [DF_AssetImported_AssetImportedID]  DEFAULT (newid()) FOR [AssetImportedID]
GO
ALTER TABLE [dbo].[AssetImported] ADD  CONSTRAINT [DF_AssetImported_Amount]  DEFAULT ((1)) FOR [Amount]
GO
ALTER TABLE [dbo].[AssetImported] ADD  CONSTRAINT [DF_AssetImported_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[AssetImported] ADD  CONSTRAINT [DF_AssetImported_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Attachment] ADD  CONSTRAINT [DF_Image_ImageID]  DEFAULT (newid()) FOR [AttachmentID]
GO
ALTER TABLE [dbo].[Attachment] ADD  CONSTRAINT [DF_Attachment_AttachmentType]  DEFAULT ((1)) FOR [AttachmentType]
GO
ALTER TABLE [dbo].[Attachment] ADD  CONSTRAINT [DF_Table_1_ItemType]  DEFAULT ((1)) FOR [TargetItemType]
GO
ALTER TABLE [dbo].[Attachment] ADD  CONSTRAINT [DF_Attachment_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Attachment] ADD  CONSTRAINT [DF_Attachment_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CategoryID]  DEFAULT (newid()) FOR [CategoryID]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Table_1_DateCreated1]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[CategoryItem] ADD  CONSTRAINT [DF_CategoryItem_CategoryItemID]  DEFAULT (newid()) FOR [CategoryItemID]
GO
ALTER TABLE [dbo].[CategoryItem] ADD  CONSTRAINT [DF_CategoryItem_ItemType]  DEFAULT ((1)) FOR [ItemType]
GO
ALTER TABLE [dbo].[Channel] ADD  CONSTRAINT [DF_Channel_ChannelID]  DEFAULT (newid()) FOR [ChannelID]
GO
ALTER TABLE [dbo].[Channel] ADD  CONSTRAINT [DF_Channel_PlatformType]  DEFAULT ((1)) FOR [PlatformType]
GO
ALTER TABLE [dbo].[Channel] ADD  CONSTRAINT [DF_Channel_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Channel] ADD  CONSTRAINT [DF_Channel_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_ClinicID]  DEFAULT (newid()) FOR [ClinicID]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_DiagnosisID]  DEFAULT (newid()) FOR [DiagnosisID]
GO
ALTER TABLE [dbo].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Disease] ADD  CONSTRAINT [DF_Disease_DiseaseID]  DEFAULT (newid()) FOR [DiseaseID]
GO
ALTER TABLE [dbo].[Disease] ADD  CONSTRAINT [DF_Disease_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Disease] ADD  CONSTRAINT [DF_Disease_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Disease] ADD  CONSTRAINT [DF_Disease_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Episode] ADD  CONSTRAINT [DF_Episode_EpisodeID]  DEFAULT (newid()) FOR [EpisodeID]
GO
ALTER TABLE [dbo].[Episode] ADD  CONSTRAINT [DF_Episode_AdmissionType]  DEFAULT ((1)) FOR [AdmissionType]
GO
ALTER TABLE [dbo].[Episode] ADD  CONSTRAINT [DF_Episode_TimeStart]  DEFAULT (getdate()) FOR [TimeStart]
GO
ALTER TABLE [dbo].[Episode] ADD  CONSTRAINT [DF_Episode_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Episode] ADD  CONSTRAINT [DF_Episode_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Episode] ADD  CONSTRAINT [DF_Episode_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_InvoiceID]  DEFAULT (newid()) FOR [InvoiceID]
GO
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_DiscountPrice]  DEFAULT ((0)) FOR [DiscountPrice]
GO
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_MedicationID]  DEFAULT (newid()) FOR [MedicationID]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_MedicineRoute_1]  DEFAULT ((1)) FOR [MedicineRoute]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_AmountPerDose_1]  DEFAULT ((1)) FOR [AmountPerDose]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_UnitType_1]  DEFAULT ((1)) FOR [UnitType]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_DosePerDay_1]  DEFAULT ((1)) FOR [DosePerDay]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_DaysCount]  DEFAULT ((1)) FOR [DaysCount]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_TotalUnitsCount]  DEFAULT ((1)) FOR [TotalUnitsCount]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_TotalBuyingNumber_1]  DEFAULT ((1)) FOR [TotalBuyingNumber]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_BuyingUnit_1]  DEFAULT ((1)) FOR [BuyingUnit]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Medication] ADD  CONSTRAINT [DF_Medication_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_MedicineID]  DEFAULT (newid()) FOR [MedicineID]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultMedRoute_1]  DEFAULT ((1)) FOR [DefaultMedRoute]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultUsageNum_1]  DEFAULT ((1)) FOR [DefaultUsageNum]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultDosePerDay_1]  DEFAULT ((1)) FOR [DefaultDosePerDay]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultAmountPerDose_1]  DEFAULT ((1)) FOR [DefaultAmountPerDose]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultBuyingNumber_1]  DEFAULT ((1)) FOR [DefaultBuyingNumber]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DefaultBuyingUnit_1]  DEFAULT ((1)) FOR [DefaultBuyingUnit]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Provider] ADD  CONSTRAINT [DF_Provider_ProviderID]  DEFAULT (newid()) FOR [ProviderID]
GO
ALTER TABLE [dbo].[Provider] ADD  CONSTRAINT [DF_Provider_UserID]  DEFAULT (newid()) FOR [UserID]
GO
ALTER TABLE [dbo].[Provider] ADD  CONSTRAINT [DF_Provider_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Provider] ADD  CONSTRAINT [DF_Provider_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_RecordID]  DEFAULT (newid()) FOR [RecordID]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_IsFree]  DEFAULT ((0)) FOR [IsFree]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Referral] ADD  CONSTRAINT [DF_Referral_ReferralID]  DEFAULT (newid()) FOR [ReferralID]
GO
ALTER TABLE [dbo].[Referral] ADD  CONSTRAINT [DF_Referral_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Referral] ADD  CONSTRAINT [DF_Referral_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Referral] ADD  CONSTRAINT [DF_Referral_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Relative] ADD  CONSTRAINT [DF_Relative_RelativeID]  DEFAULT (newid()) FOR [RelativeID]
GO
ALTER TABLE [dbo].[Relative] ADD  CONSTRAINT [DF_Relative_RelativeType]  DEFAULT ((1)) FOR [RelativeType]
GO
ALTER TABLE [dbo].[Relative] ADD  CONSTRAINT [DF_Relative_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Relative] ADD  CONSTRAINT [DF_Relative_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_RoleID]  DEFAULT (newid()) FOR [RoleID]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_UserID]  DEFAULT (newid()) FOR [UserID]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_RoleType]  DEFAULT ((1)) FOR [RoleType]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_ScheduleID]  DEFAULT (newid()) FOR [ScheduleID]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_ServiceID]  DEFAULT (newid()) FOR [ServiceID]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Summary] ADD  CONSTRAINT [DF_Summary_SummaryID]  DEFAULT (newid()) FOR [SummaryID]
GO
ALTER TABLE [dbo].[Summary] ADD  CONSTRAINT [DF_Summary_Title]  DEFAULT ((1)) FOR [Title]
GO
ALTER TABLE [dbo].[Summary] ADD  CONSTRAINT [DF_Summary_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Summary] ADD  CONSTRAINT [DF_Summary_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Summary] ADD  CONSTRAINT [DF_Summary_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_UserID]  DEFAULT (newid()) FOR [UserID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Clinic]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_User1] FOREIGN KEY([UserTargetedID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_User1]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Clinic1] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Clinic1]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Referral] FOREIGN KEY([ReferralID])
REFERENCES [dbo].[Referral] ([ReferralID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Referral]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Service1] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Service1]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User1] FOREIGN KEY([UserCreateID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User1]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User2] FOREIGN KEY([UserAppointID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User2]
GO
ALTER TABLE [dbo].[AssetConfig]  WITH CHECK ADD  CONSTRAINT [FK_AssetConfig_Asset] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Asset] ([AssetID])
GO
ALTER TABLE [dbo].[AssetConfig] CHECK CONSTRAINT [FK_AssetConfig_Asset]
GO
ALTER TABLE [dbo].[AssetConsumed]  WITH CHECK ADD  CONSTRAINT [FK_AssetConsumed_Asset] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Asset] ([AssetID])
GO
ALTER TABLE [dbo].[AssetConsumed] CHECK CONSTRAINT [FK_AssetConsumed_Asset]
GO
ALTER TABLE [dbo].[AssetImported]  WITH CHECK ADD  CONSTRAINT [FK_AssetImported_Asset] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Asset] ([AssetID])
GO
ALTER TABLE [dbo].[AssetImported] CHECK CONSTRAINT [FK_AssetImported_Asset]
GO
ALTER TABLE [dbo].[CategoryItem]  WITH CHECK ADD  CONSTRAINT [FK_CategoryItem_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[CategoryItem] CHECK CONSTRAINT [FK_CategoryItem_Category]
GO
ALTER TABLE [dbo].[Channel]  WITH CHECK ADD  CONSTRAINT [FK_Channel_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Channel] CHECK CONSTRAINT [FK_Channel_User]
GO
ALTER TABLE [dbo].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Disease] FOREIGN KEY([DiseaseID])
REFERENCES [dbo].[Disease] ([DiseaseID])
GO
ALTER TABLE [dbo].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Disease]
GO
ALTER TABLE [dbo].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Summary] FOREIGN KEY([SummaryID])
REFERENCES [dbo].[Summary] ([SummaryID])
GO
ALTER TABLE [dbo].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Summary]
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_Appointment] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointment] ([AppointmentID])
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_Appointment]
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_Clinic]
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_Referral] FOREIGN KEY([ReferralID])
REFERENCES [dbo].[Referral] ([ReferralID])
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_Referral]
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_User] FOREIGN KEY([UserAdmittedID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_User]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Episode] FOREIGN KEY([EpisodeID])
REFERENCES [dbo].[Episode] ([EpisodeID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Episode]
GO
ALTER TABLE [dbo].[Medication]  WITH CHECK ADD  CONSTRAINT [FK_Medication_Medicine] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([MedicineID])
GO
ALTER TABLE [dbo].[Medication] CHECK CONSTRAINT [FK_Medication_Medicine]
GO
ALTER TABLE [dbo].[Medication]  WITH CHECK ADD  CONSTRAINT [FK_Medication_Summary] FOREIGN KEY([SummaryID])
REFERENCES [dbo].[Summary] ([SummaryID])
GO
ALTER TABLE [dbo].[Medication] CHECK CONSTRAINT [FK_Medication_Summary]
GO
ALTER TABLE [dbo].[Provider]  WITH CHECK ADD  CONSTRAINT [FK_Provider_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[Provider] CHECK CONSTRAINT [FK_Provider_Clinic]
GO
ALTER TABLE [dbo].[Provider]  WITH CHECK ADD  CONSTRAINT [FK_Provider_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[Provider] CHECK CONSTRAINT [FK_Provider_Service]
GO
ALTER TABLE [dbo].[Provider]  WITH CHECK ADD  CONSTRAINT [FK_Provider_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Provider] CHECK CONSTRAINT [FK_Provider_User]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Episode] FOREIGN KEY([EpisodeID])
REFERENCES [dbo].[Episode] ([EpisodeID])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Episode]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Invoice]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Service]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_User] FOREIGN KEY([UserAppointID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_User]
GO
ALTER TABLE [dbo].[Referral]  WITH CHECK ADD  CONSTRAINT [FK_Referral_Summary] FOREIGN KEY([SummaryID])
REFERENCES [dbo].[Summary] ([SummaryID])
GO
ALTER TABLE [dbo].[Referral] CHECK CONSTRAINT [FK_Referral_Summary]
GO
ALTER TABLE [dbo].[Relative]  WITH CHECK ADD  CONSTRAINT [FK_Relative_User2] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Relative] CHECK CONSTRAINT [FK_Relative_User2]
GO
ALTER TABLE [dbo].[Relative]  WITH CHECK ADD  CONSTRAINT [FK_Relative_User3] FOREIGN KEY([UserRelativeID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Relative] CHECK CONSTRAINT [FK_Relative_User3]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Clinic]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_User]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Clinic]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_User]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Clinic] FOREIGN KEY([ClinicID])
REFERENCES [dbo].[Clinic] ([ClinicID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Clinic]
GO
ALTER TABLE [dbo].[Summary]  WITH CHECK ADD  CONSTRAINT [FK_Summary_Episode1] FOREIGN KEY([EpisodeID])
REFERENCES [dbo].[Episode] ([EpisodeID])
GO
ALTER TABLE [dbo].[Summary] CHECK CONSTRAINT [FK_Summary_Episode1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Asset, 2 = Consumable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Asset', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attachment', @level2type=N'COLUMN',@level2name=N'AttachmentType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Service, 2 = Asset' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attachment', @level2type=N'COLUMN',@level2name=N'TargetItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Service, 2 = Asset' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoryItem', @level2type=N'COLUMN',@level2name=N'ItemType'
GO
USE [master]
GO
ALTER DATABASE [ERP] SET  READ_WRITE 
GO
