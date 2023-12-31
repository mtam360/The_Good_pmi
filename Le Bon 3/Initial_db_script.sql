/****** Object:  UserDefinedFunction [dbo].[Split_Filename]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[Split_Filename] (@String VARCHAR (MAX), @Delimiter CHAR (1))
   RETURNS @results TABLE (id int identity(1,1),items VARCHAR (MAX))
AS
   BEGIN
     DECLARE @index   INT
     DECLARE @slice   VARCHAR (8000)
     SELECT @index = 1
     IF len (@String) < 1 OR @String IS NULL
         RETURN
     WHILE @index != 0
     BEGIN
         SET @index = charindex (@Delimiter, @String)
         IF @index != 0
           SET @slice = left (@String, @index - 1)
         ELSE
           SET @slice = @String
         IF (len (@slice) > 0)
           INSERT INTO @results (Items)
           VALUES (@slice)
         SET @String = right (@String, len (@String) - @index)
         IF len (@String) = 0
           BREAK
     END
     RETURN
   END;
GO
/****** Object:  Table [dbo].[D_AREA]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_AREA](
	[id_area] [int] IDENTITY(1,1) NOT NULL,
	[id_region] [int] NULL,
	[id_market] [int] NULL,
	[area] [varchar](100) NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_CITY]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_CITY](
	[id_city] [int] IDENTITY(1,1) NOT NULL,
	[id_area] [int] NULL,
	[id_region] [int] NULL,
	[id_market] [int] NULL,
	[City] [varchar](100) NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_DATE]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_DATE](
	[Id_Date] [int] NULL,
	[date] [date] NULL,
	[year] [int] NULL,
	[quarter] [int] NULL,
	[month] [varchar](50) NULL,
	[week] [varchar](50) NULL,
	[week_iso] [int] NULL,
	[day] [varchar](50) NULL,
	[is_working_day] [int] NULL,
	[week_from] [varchar](50) NULL,
	[week_to] [varchar](50) NULL,
	[week_from_to] [varchar](50) NULL,
	[week_desc] [varchar](50) NULL,
	[Nb_working_day(month)] [int] NULL,
	[Nb_working_day(week)] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_MARKET]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_MARKET](
	[id_market] [int] IDENTITY(1,1) NOT NULL,
	[Market] [varchar](100) NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_PRODUCT]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_PRODUCT](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[product_code] [varchar](50) NULL,
	[fa_code] [varchar](50) NULL,
	[brand_subfamily] [varchar](50) NULL,
	[brand_family] [varchar](50) NULL,
	[product_type] [varchar](100) NULL,
	[trade_market_owner] [varchar](50) NULL,
	[EBROM_description] [varchar](50) NULL,
	[is_PMI_brand] [int] NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_REGION]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_REGION](
	[id_region] [int] IDENTITY(1,1) NOT NULL,
	[id_market] [int] NULL,
	[Region] [varchar](100) NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_RETAILERS]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_RETAILERS](
	[id_retailer] [int] IDENTITY(1,1) NOT NULL,
	[pos_code] [varchar](100) NULL,
	[name_of_store] [varchar](100) NULL,
	[segmentation] [varchar](100) NULL,
	[type] [varchar](100) NULL,
	[channel] [varchar](100) NULL,
	[Origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_SALES_REPRESENTATIVE]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SALES_REPRESENTATIVE](
	[id_sales_representive] [int] IDENTITY(1,1) NOT NULL,
	[position_code] [varchar](100) NULL,
	[position_name] [varchar](201) NULL,
	[supervisor] [varchar](50) NULL,
	[field_manager] [varchar](50) NULL,
	[country_manager] [varchar](50) NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_TERRITORY]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_TERRITORY](
	[id_territorry] [int] IDENTITY(1,1) NOT NULL,
	[id_city] [int] NULL,
	[id_area] [int] NULL,
	[id_region] [int] NULL,
	[id_market] [int] NULL,
	[Territory] [varchar](100) NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error Quest online]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error Quest online](
	[CI_ID] [varchar](100) NULL,
	[CI_Date] [varchar](100) NULL,
	[CI_Time] [varchar](100) NULL,
	[Region] [varchar](100) NULL,
	[Area] [varchar](100) NULL,
	[Venue] [varchar](100) NULL,
	[Venue _ype] [varchar](100) NULL,
	[Venue_iSMS] [varchar](100) NULL,
	[Program] [varchar](100) NULL,
	[Program_Brand] [varchar](100) NULL,
	[Profile] [varchar](100) NULL,
	[Age_Verification] [varchar](100) NULL,
	[Gender] [varchar](100) NULL,
	[Consumer_Main_Brand] [varchar](100) NULL,
	[Consumer_Main_Sub-Brand] [varchar](100) NULL,
	[Occasional_Brand] [varchar](100) NULL,
	[Occasional_Sub-Brand] [varchar](100) NULL,
	[Is_PM_Smoker] [varchar](100) NULL,
	[Team] [varchar](100) NULL,
	[Team_Leader] [varchar](100) NULL,
	[CE_username] [varchar](100) NULL,
	[CE_Full_Name] [varchar](100) NULL,
	[Check_In_DateTime] [varchar](100) NULL,
	[Check_Out_DateTime] [varchar](100) NULL,
	[Business_Day] [varchar](100) NULL,
	[Question 001] [varchar](100) NULL,
	[Answer 001] [varchar](100) NULL,
	[Question 002] [varchar](100) NULL,
	[Answer 002] [varchar](100) NULL,
	[Question 003] [varchar](100) NULL,
	[Answer 003] [varchar](100) NULL,
	[Question 004] [varchar](100) NULL,
	[Answer 004] [varchar](100) NULL,
	[Question 005] [varchar](100) NULL,
	[Answer 005] [varchar](100) NULL,
	[Question 006] [varchar](100) NULL,
	[Answer 006] [varchar](100) NULL,
	[Question 007] [varchar](100) NULL,
	[Answer 007] [varchar](100) NULL,
	[Question 008] [varchar](100) NULL,
	[Answer 008] [varchar](100) NULL,
	[Question 009] [varchar](100) NULL,
	[Answer 009] [varchar](100) NULL,
	[Question 10] [varchar](100) NULL,
	[Answer 10] [varchar](100) NULL,
	[Question 11] [varchar](100) NULL,
	[Answer 11] [varchar](100) NULL,
	[Question 12] [varchar](100) NULL,
	[Answer 012] [varchar](100) NULL,
	[Question 13] [varchar](100) NULL,
	[Answer 13] [varchar](100) NULL,
	[Question 14] [varchar](100) NULL,
	[Answer 14] [varchar](100) NULL,
	[Question 15] [varchar](100) NULL,
	[Answer 15] [varchar](100) NULL,
	[Question 16] [varchar](100) NULL,
	[Answer 16] [varchar](100) NULL,
	[Question 17] [varchar](100) NULL,
	[Answer 17] [varchar](100) NULL,
	[Question 18] [varchar](100) NULL,
	[Answer 18] [varchar](100) NULL,
	[Question 19] [varchar](100) NULL,
	[Answer 019] [varchar](100) NULL,
	[Question 20] [varchar](100) NULL,
	[Answer 20] [varchar](100) NULL,
	[origin] [varchar](6) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error Retailer tmp]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error Retailer tmp](
	[full_date] [varchar](100) NULL,
	[time] [varchar](100) NULL,
	[year] [varchar](100) NULL,
	[month] [varchar](100) NULL,
	[week] [varchar](100) NULL,
	[country] [varchar](100) NULL,
	[salesrep_name] [varchar](100) NULL,
	[salesrep_surname] [varchar](100) NULL,
	[salessep_username] [varchar](100) NULL,
	[retailer_segmentation] [varchar](100) NULL,
	[retailer_username] [varchar](100) NULL,
	[retailer_telephone] [varchar](100) NULL,
	[retailer_name_of_store] [varchar](100) NULL,
	[retailer_outlet_type] [varchar](100) NULL,
	[retailer_route] [varchar](100) NULL,
	[retailer_region] [varchar](100) NULL,
	[retailer_area] [varchar](100) NULL,
	[retailer_territory] [varchar](100) NULL,
	[retailer_address] [varchar](100) NULL,
	[products] [varchar](100) NULL,
	[visibility] [varchar](100) NULL,
	[quantity] [varchar](100) NULL,
	[pposm] [varchar](100) NULL,
	[stock] [varchar](100) NULL,
	[handling] [varchar](100) NULL,
	[sales] [varchar](100) NULL,
	[visibility_on_posm] [varchar](100) NULL,
	[swap_quantity] [varchar](100) NULL,
	[volume_incentive] [varchar](100) NULL,
	[price_compliance] [varchar](100) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_CONSUMER_ENAGEMENT_QUEST]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_CONSUMER_ENAGEMENT_QUEST](
	[id_date] [int] NULL,
	[Id_business_date] [int] NULL,
	[id_retailer] [int] NULL,
	[id_sales_representive] [int] NULL,
	[id_product_requested] [int] NULL,
	[id_region] [int] NULL,
	[CI ID] [int] NULL,
	[Is PM Smoker] [varchar](100) NULL,
	[Question 001] [varchar](100) NULL,
	[Answer 001] [varchar](100) NULL,
	[Question 002] [varchar](100) NULL,
	[Answer 002] [varchar](100) NULL,
	[Question 003] [varchar](100) NULL,
	[Answer 003] [varchar](100) NULL,
	[Question 004] [varchar](100) NULL,
	[Answer 004] [varchar](100) NULL,
	[Question 005] [varchar](100) NULL,
	[Answer 005] [varchar](100) NULL,
	[Question 006] [varchar](100) NULL,
	[Answer 006] [varchar](100) NULL,
	[Question 007] [varchar](100) NULL,
	[Answer 007] [varchar](100) NULL,
	[Question 008] [varchar](100) NULL,
	[Answer 008] [varchar](100) NULL,
	[Question 009] [varchar](100) NULL,
	[Answer 009] [varchar](100) NULL,
	[Question 10] [varchar](100) NULL,
	[Answer 10] [varchar](100) NULL,
	[Question 11] [varchar](100) NULL,
	[Answer 11] [varchar](100) NULL,
	[Question 12] [varchar](100) NULL,
	[Answer 012] [varchar](100) NULL,
	[Question 13] [varchar](100) NULL,
	[Answer 13] [varchar](100) NULL,
	[Question 14] [varchar](100) NULL,
	[Answer 14] [varchar](100) NULL,
	[Question 15] [varchar](100) NULL,
	[Answer 15] [varchar](100) NULL,
	[Question 16] [varchar](100) NULL,
	[Answer 16] [varchar](100) NULL,
	[Question 17] [varchar](100) NULL,
	[Answer 17] [varchar](100) NULL,
	[Question 18] [varchar](100) NULL,
	[Answer 18] [varchar](100) NULL,
	[Question 19] [varchar](100) NULL,
	[Answer 019] [varchar](100) NULL,
	[Question 20] [varchar](100) NULL,
	[Answer 20] [varchar](100) NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_CUSTOMER_ENGAGEMENT]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[F_CUSTOMER_ENGAGEMENT](
	[Id_date] [int] NULL,
	[Id_business_date] [int] NULL,
	[id_retailer] [int] NULL,
	[id_sales_representive] [int] NULL,
	[id_region] [int] NULL,
	[CI_ID] [int] NULL,
	[volume_provided] [int] NULL,
	[campagn_activity] [varchar](100) NULL,
	[brand_program] [varchar](100) NULL,
	[id_product_requested] [int] NULL,
	[brand_requested] [varchar](100) NULL,
	[id_product_provided] [int] NULL,
	[brand_provided] [varchar](100) NULL,
	[is_Stick] [int] NULL,
	[BP_Stick] [varchar](100) NULL,
	[is_DCC] [int] NULL,
	[is_FG] [int] NULL,
	[trial_label] [varchar](100) NULL,
	[is_trial_product] [varchar](100) NULL,
	[trial_fro_to] [varchar](100) NULL,
	[is_AC_product] [varchar](100) NULL,
	[Premium_fro_to] [varchar](100) NULL,
	[Check_In_DateTime] [datetime] NULL,
	[Check_Out_DateTime] [datetime] NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL			
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_TRADE_ENGAGEMENT]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_TRADE_ENGAGEMENT](
	[Id_date] [int] NULL,
	[id_retailer] [int] NULL,
	[id_sales_representive] [int] NULL,
	[id_product] [int] NULL,
	[id_territory] [int] NULL,
	[visibility] [varchar](100) NULL,
	[quantity] [bigint] NULL,
	[pposm] [bigint] NULL,
	[stock] [bigint] NULL,
	[handling] [int] NULL,
	[sales] [bigint] NULL,
	[is_OOS] [int] NULL,
	[is_OOSC] [int] NULL,
	[is_intro] [int] NULL,
	[visibility_on_posm] [int] NULL,
	[swap_quantity] [int] NULL,
	[volume_incentive] [int] NULL,
	[price_compliance] [int] NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageMonitoring]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageMonitoring](
	[Pk_ID] [nvarchar](100) NULL,
	[Machine_Name] [nvarchar](200) NULL,
	[Package_Name] [nvarchar](200) NULL,
	[Task_Name] [nvarchar](200) NULL,
	[Error_Code] [int] NULL,
	[Error_Description] [nvarchar](max) NULL,
	[Start_DATE] [smalldatetime] NULL,
	[FileSource] [nvarchar](200) NULL,
	[Success] [nvarchar](200) NULL,
	[End_DATE] [smalldatetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PARAM_HOLIDAYS]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARAM_HOLIDAYS](
	[holiday_date] [date] NULL,
	[description] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMP_CUST_QUEST_ONLINE]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMP_CUST_QUEST_ONLINE](
	[CI_ID] [int] NULL,
	[CI_Date] [date] NULL,
	[CI_Time] [varchar](100) NULL,
	[Region] [varchar](100) NULL,
	[Area] [varchar](100) NULL,
	[Venue] [varchar](100) NULL,
	[Venue _ype] [varchar](100) NULL,
	[Venue_iSMS] [varchar](100) NULL,
	[Program] [varchar](100) NULL,
	[Program_Brand] [varchar](100) NULL,
	[Profile] [varchar](100) NULL,
	[Age_Verification] [varchar](100) NULL,
	[Gender] [varchar](100) NULL,
	[Consumer_Main_Brand] [varchar](100) NULL,
	[Consumer_Main_Sub-Brand] [varchar](100) NULL,
	[Occasional_Brand] [varchar](100) NULL,
	[Occasional_Sub-Brand] [varchar](100) NULL,
	[Is_PM_Smoker] [varchar](100) NULL,
	[Team] [varchar](100) NULL,
	[Team_Leader] [varchar](100) NULL,
	[CE_username] [varchar](100) NULL,
	[CE_Full_Name] [varchar](100) NULL,
	[Check_In_DateTime] [varchar](100) NULL,
	[Check_Out_DateTime] [varchar](100) NULL,
	[Business_Day] [varchar](100) NULL,
	[Question 001] [varchar](100) NULL,
	[Answer 001] [varchar](100) NULL,
	[Question 002] [varchar](100) NULL,
	[Answer 002] [varchar](100) NULL,
	[Question 003] [varchar](100) NULL,
	[Answer 003] [varchar](100) NULL,
	[Question 004] [varchar](100) NULL,
	[Answer 004] [varchar](100) NULL,
	[Question 005] [varchar](100) NULL,
	[Answer 005] [varchar](100) NULL,
	[Question 006] [varchar](100) NULL,
	[Answer 006] [varchar](100) NULL,
	[Question 007] [varchar](100) NULL,
	[Answer 007] [varchar](100) NULL,
	[Question 008] [varchar](100) NULL,
	[Answer 008] [varchar](100) NULL,
	[Question 009] [varchar](100) NULL,
	[Answer 009] [varchar](100) NULL,
	[Question 10] [varchar](100) NULL,
	[Answer 10] [varchar](100) NULL,
	[Question 11] [varchar](100) NULL,
	[Answer 11] [varchar](100) NULL,
	[Question 12] [varchar](100) NULL,
	[Answer 012] [varchar](100) NULL,
	[Question 13] [varchar](100) NULL,
	[Answer 13] [varchar](100) NULL,
	[Question 14] [varchar](100) NULL,
	[Answer 14] [varchar](100) NULL,
	[Question 15] [varchar](100) NULL,
	[Answer 15] [varchar](100) NULL,
	[Question 16] [varchar](100) NULL,
	[Answer 16] [varchar](100) NULL,
	[Question 17] [varchar](100) NULL,
	[Answer 17] [varchar](100) NULL,
	[Question 18] [varchar](100) NULL,
	[Answer 18] [varchar](100) NULL,
	[Question 19] [varchar](100) NULL,
	[Answer 019] [varchar](100) NULL,
	[Question 20] [varchar](100) NULL,
	[Answer 20] [varchar](100) NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMP_CUSTOMERS_CONTACT_ONLINE]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMP_CUSTOMERS_CONTACT_ONLINE](
	[CI_ID] [int] NULL,
	[Business_Day] [varchar](100) NULL,
	[CI_Date] [varchar](100) NULL,
	[CI_Time] [varchar](100) NULL,
	[Region] [varchar](100) NULL,
	[Area] [varchar](100) NULL,
	[Venue] [varchar](100) NULL,
	[Venue _ype] [varchar](100) NULL,
	[Venue_Category] [varchar](100) NULL,
	[Venue_Channel] [varchar](100) NULL,
	[Venue_Sub-Channel] [varchar](100) NULL,
	[Venue_iSMS] [varchar](100) NULL,
	[Program] [varchar](100) NULL,
	[Program_Brand] [varchar](100) NULL,
	[Module] [varchar](100) NULL,
	[Profile] [varchar](100) NULL,
	[Age_Verification] [varchar](100) NULL,
	[Gender] [varchar](100) NULL,
	[Consumer_Main_Brand] [varchar](100) NULL,
	[Consumer_Main_Sub-Brand] [varchar](100) NULL,
	[Occasional_Brand] [varchar](100) NULL,
	[Occasional_Sub-Brand] [varchar](100) NULL,
	[Is_PM_Smoker] [varchar](100) NULL,
	[With_Profile] [varchar](100) NULL,
	[Product_Type] [varchar](100) NULL,
	[Product_Item] [varchar](100) NULL,
	[Number_Provided] [int] NULL,
	[Team] [varchar](100) NULL,
	[Team_Leader] [varchar](100) NULL,
	[CE_username] [varchar](100) NULL,
	[CE_Full_Name] [varchar](100) NULL,
	[Check_In_DateTime] [smalldatetime] NULL,
	[Check_Out_DateTime] [smalldatetime] NULL,
	[Device_Id] [varchar](100) NULL,
	[origin] [varchar](50) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMP_RETAILERS_TRANSACTIONS]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMP_RETAILERS_TRANSACTIONS](
	[full_date] [varchar](100) NULL,
	[time] [varchar](100) NULL,
	[year] [varchar](100) NULL,
	[month] [varchar](100) NULL,
	[week] [varchar](100) NULL,
	[country] [varchar](100) NULL,
	[salesrep_name] [varchar](100) NULL,
	[salesrep_surname] [varchar](100) NULL,
	[salessep_username] [varchar](100) NULL,
	[retailer_segmentation] [varchar](100) NULL,
	[retailer_username] [varchar](100) NULL,
	[retailer_telephone] [varchar](100) NULL,
	[retailer_name_of_store] [varchar](100) NULL,
	[retailer_outlet_type] [varchar](100) NULL,
	[retailer_route] [varchar](100) NULL,
	[retailer_region] [varchar](100) NULL,
	[retailer_area] [varchar](100) NULL,
	[retailer_territory] [varchar](100) NULL,
	[retailer_address] [varchar](100) NULL,
	[products] [varchar](100) NULL,
	[product_type] [varchar](100) NULL,
	[visibility] [varchar](100) NULL,
	[quantity] [bigint] NULL,
	[pposm] [bigint] NULL,
	[stock] [bigint] NULL,
	[handling] [varchar](100) NULL,
	[sales] [bigint] NULL,
	[visibility_on_posm] [int] NULL,
	[swap_quantity] [int] NULL,
	[volume_incentive] [int] NULL,
	[price_compliance] [int] NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[D_AREA] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[D_CITY] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[D_MARKET] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[D_PRODUCT] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[D_REGION] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[D_RETAILERS] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[D_SALES_REPRESENTATIVE] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[D_TERRITORY] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[F_CONSUMER_ENAGEMENT_QUEST] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[F_CUSTOMER_ENGAGEMENT] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[F_TRADE_ENGAGEMENT] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[PARAM_HOLIDAYS] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[TMP_CUST_QUEST_ONLINE] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[TMP_CUSTOMERS_CONTACT_ONLINE] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[TMP_RETAILERS_TRANSACTIONS] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
/****** Object:  StoredProcedure [dbo].[Load_D_Date]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Load_D_Date] AS
delete from D_Date
DECLARE @maxDate date, @minDate date;

set @maxDate =   cast( cast(datepart(yyyy,getdate()) as varchar)+'-12-31' as Date)
--(select max(A)  from 
--(
--select max (convert(date,[full_date],103)) as A from [dbo].[TMP_RETAILERS_TRANSACTIONS]
--where convert(date,[full_date],103) is not null) as b
--)


set @minDate= cast('2018-01-01' as Date)
--(select min(A) from 
--( 
--select min (convert(date,[full_date],103)) as A from [dbo].[TMP_RETAILERS_TRANSACTIONS]
--where convert(date,[full_date] ,103) is not null
--) as b
--)
;
set language ENGLISH;
with DimDate (date,annee,quarter, month, day)
as (select cast(@minDate as date) ,DATEPART(yyyy,cast(@minDate as date)),
    DATEPART(QQ,cast(@minDate as date)), DATENAME(MONTH,cast(@minDate as date)),
	DATENAME(dw,cast(@minDate as date))
	union all
	select DATEADD(day, 1, date), datepart(yyyy,DATEADD(day, 1, date)),
	DATEPART(qq,DATEADD(day, 1, date)),DATENAME(month,DATEADD(day, 1, date)),DATENAME(dw,DATEADD(day, 1, date))
	from DimDate
	where date <Cast(@maxDate as date))
	insert into D_Date 
	select *, sum(is_working_day) over (PARTITION BY annee,c.[month] ORDER BY c.annee) as [Nb_working_day(month)],
	sum(is_working_day) over (PARTITION BY annee,c.[Week_ISO] ORDER BY c.annee) as [Nb_working_day(week)]
	from (
	select cast(format(b.date,'yyyyMMdd') as int) as Id_date, b.date,b.annee,b.quarter,b.month,b.week,b.Week_ISO,b.day,
	case when (holiday_date is not null) or (1 + ((5 + DATEPART(dw, Date) + @@DATEFIRST) % 7))=7  then 0 else 1 end as is_working_day,b.week_from,b.week_to
	, concat(b.week_from,' - ',b.week_to)  as week_from_to,
	 'WC '+ b.week_from as week_desc
	from (select d.*, datePart(Month,Date) as MonthNum, 
	  DATEPART(WEEK,     Date) as week
	--  datePart(WEEK,Date) as week,
	,cast(datePart(ISO_WEEK,Date) as varchar) as Week_ISO,
	--format(dateadd(day,-(1 + ((5 + DATEPART(dw, Date) + @@DATEFIRST) % 7)-1),Date),'dd MMM\''yy') as week_from,
	--DATEADD(DAY, 1+1 - DATEPART(WEEKDAY,   Date),Date)
	format(DATEADD(DAY, 1+1 - DATEPART(WEEKDAY,   Date),Date),'dd MMM\''yy') as week_from,
	format(DATEADD(DAY, 6, DATEADD(DAY, 1+1 - DATEPART(WEEKDAY,  Date),Date)),'dd MMM\''yy') as week_to,
	 h.holiday_date
	from DimDate d left join [dbo].[PARAM_HOLIDAYS] h on d.date=h.holiday_date) as B ) C 
	option (maxrecursion 0);
GO
/****** Object:  StoredProcedure [dbo].[NamingFile]    Script Date: 09/09/2020 16:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[NamingFile] @DataSource nvarchar(50), @Scope nvarchar(50), 
@FileName nvarchar(50) ,
@Result int = null OUTPUT  
AS    
  
-- Validate the datasource  
IF len((select items from dbo.Split_Filename(@FileName,'_') where id=1)) <> len(@DataSource) 
   BEGIN  
       PRINT 'ERROR: You must specify a valide file name, datasource must have 3 characters'  
	   set @Result=1
       RETURN ( @Result)
   END  
ELSE  
   BEGIN  
   -- Make sure the value is valid.  
   IF (select items from dbo.Split_Filename(@FileName,'_') where id=1) <> @DataSource
    begin 
	   PRINT 'ERROR: You must specify a valide file name, datasource value must is '+@DataSource
	   set @Result=2
       RETURN ( @Result)
	end
   END  

IF len((select items from dbo.Split_Filename(@FileName,'_') where id=2)) <> len(@Scope) 
   BEGIN  
       PRINT 'ERROR: You must specify a valide file name, scope must have 3 characters'  
	   set @Result=3
       RETURN ( @Result)
   END  
ELSE  
   BEGIN  
   -- Make sure the value is valid.  
   IF (select items from dbo.Split_Filename(@FileName,'_') where id=2) <> @Scope
    begin
	  PRINT 'ERROR: You must specify a valide file name, scope value must is '+@Scope
	   set @Result=4
       RETURN ( @Result)
	end
   END  

-- Check to see if the rest of value is NULL.  
IF (select items from dbo.Split_Filename(@FileName,'_') where id=3)  IS NULL  
begin
	PRINT 'ERROR: You must specify a valide file name, it must have random value after datasource and scope '
	   set @Result=5
       RETURN ( @Result)
end
ELSE
  begin
	   print 'SUCCESS!!'  
	   set @Result=0
       RETURN ( @Result)
  end
GO
create procedure UPDATE_BUSINESS_DATE AS 
update [dbo].[F_CUSTOMER_ENGAGEMENT]
set Id_business_date= cast(q.[Answer 008]+ case when q.[Answer 007]<10 then'0'+q.[Answer 007] else +q.[Answer 007] end +
case when q.[Answer 006]<10 then'0'+q.[Answer 006] else +q.[Answer 006] end as int) from [dbo].[F_CUSTOMER_ENGAGEMENT] a join [dbo].[F_CONSUMER_ENAGEMENT_QUEST] q
on a.CI_ID=q.[CI ID] and a.id_retailer=q.id_retailer and a.id_sales_representive=q.id_sales_representive and a.Id_date=q.id_date
and (a.id_product_provided=q.id_product_requested or a.id_product_requested=q.id_product_requested)
and (cast(q.[Answer 008] as int)-datepart(year,cast(cast(a.Id_business_date as varchar) as date))<=1 or a.Id_business_date is null)
GO


insert into [dbo].[D_PRODUCT]values('Unknown','Unknown','Unknown','Unknown',
									'Unknown','Unknown','Unknown',0,'Unknown',getdate())

go

--insert into [dbo].[D_GEOTREE]values('Unknown','Unknown','Unknown','Unknown',
--									'Unknown','Unknown','Unknown',getdate())

go

insert into [dbo].[D_RETAILERS]values('Unknown','Unknown','Unknown','Unknown',
									'Unknown','Unknown',getdate())

go

insert into [dbo].[D_SALES_REPRESENTATIVE]values('Unknown','Unknown','Unknown','Unknown',
									'Unknown','Unknown',getdate())


go

INSERT INTO [dbo].[D_MARKET]
           ([Market]
           ,[origin]
           ,[updated_at])
     VALUES
           ('Unknown','Unknown',getdate())
GO


INSERT INTO [dbo].[D_REGION]
           ([id_market]
           ,[Region]
           ,[origin]
           ,[updated_at])
     VALUES
           (1
           ,'Unknown','Unknown',getdate())
GO

INSERT INTO [dbo].[D_AREA]
           ([id_region]
           ,[id_market]
           ,[area]
           ,[origin]
           ,[updated_at])
     VALUES
           (1
           ,1
           ,'Unknown','Unknown',getdate())
GO

INSERT INTO [dbo].[D_CITY]
           ([id_area]
           ,[id_region]
           ,[id_market]
           ,[City]
           ,[origin]
           ,[updated_at])
     VALUES
           (1
           ,1
           ,1
           ,'Unknown','Unknown',getdate())
GO
INSERT INTO [dbo].[D_TERRITORY]
           ([id_city]
           ,[id_area]
           ,[id_region]
           ,[id_market]
           ,[Territory]
           ,[origin]
           ,[updated_at])
     VALUES
           (1
           ,1
           ,1
           ,1
           ,'Unknown','Unknown',getdate())

	
GO

truncate table [dbo].[F_TRADE_ENGAGEMENT]