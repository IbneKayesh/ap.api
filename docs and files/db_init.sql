USE [esapdb]
GO
/****** Object:  StoredProcedure [dbo].[SP_AP_USERS]    Script Date: 3/8/2025 2:52:53 PM ******/
DROP PROCEDURE [dbo].[SP_AP_USERS]
GO
/****** Object:  StoredProcedure [dbo].[SP_AP_ROLES]    Script Date: 3/8/2025 2:52:53 PM ******/
DROP PROCEDURE [dbo].[SP_AP_ROLES]
GO
ALTER TABLE [dbo].[AP_USERS] DROP CONSTRAINT [DF_AP_USERS_REVISION_NO]
GO
ALTER TABLE [dbo].[AP_USERS] DROP CONSTRAINT [DF_AP_USERS_UPDATED_DATE]
GO
ALTER TABLE [dbo].[AP_USERS] DROP CONSTRAINT [DF_AP_USERS_CREATED_DATE]
GO
ALTER TABLE [dbo].[AP_USERS] DROP CONSTRAINT [DF_AP_USERS_IS_ACTIVE]
GO
ALTER TABLE [dbo].[AP_USERS] DROP CONSTRAINT [DF_AP_USERS_DEFAULT_ROLE]
GO
ALTER TABLE [dbo].[AP_USERS] DROP CONSTRAINT [DF_AP_USERS_WELCOME_TEXT]
GO
ALTER TABLE [dbo].[AP_USERS] DROP CONSTRAINT [DF_AP_USERS_LAST_LOGIN]
GO
ALTER TABLE [dbo].[AP_USERS] DROP CONSTRAINT [DF_AP_USERS_LAST_LOGIN1]
GO
ALTER TABLE [dbo].[AP_ROLES] DROP CONSTRAINT [DF_AP_ROLES_REVISION_NO]
GO
ALTER TABLE [dbo].[AP_ROLES] DROP CONSTRAINT [DF_AP_ROLES_UPDATE_DATE]
GO
ALTER TABLE [dbo].[AP_ROLES] DROP CONSTRAINT [DF_AP_ROLES_CREATED_DATE]
GO
ALTER TABLE [dbo].[AP_ROLES] DROP CONSTRAINT [DF_AP_ROLES_IS_ACTIVE]
GO
/****** Object:  Table [dbo].[AP_USERS]    Script Date: 3/8/2025 2:52:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AP_USERS]') AND type in (N'U'))
DROP TABLE [dbo].[AP_USERS]
GO
/****** Object:  Table [dbo].[AP_ROLES]    Script Date: 3/8/2025 2:52:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AP_ROLES]') AND type in (N'U'))
DROP TABLE [dbo].[AP_ROLES]
GO
/****** Object:  Table [dbo].[AP_ROLES]    Script Date: 3/8/2025 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AP_ROLES](
	[ID] [nvarchar](50) NOT NULL,
	[ROLE_NAME] [nvarchar](50) NOT NULL,
	[ROLE_DESC] [nvarchar](50) NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[CREATED_USER] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[UPDATED_USER] [nvarchar](50) NULL,
	[UPDATED_DATE] [datetime] NULL,
	[REVISION_NO] [int] NULL,
 CONSTRAINT [PK_AP_ROLES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AP_USERS]    Script Date: 3/8/2025 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AP_USERS](
	[ID] [nvarchar](50) NOT NULL,
	[USER_CODE] [nvarchar](50) NULL,
	[USER_NAME] [nvarchar](50) NOT NULL,
	[DESIGNATION] [nvarchar](50) NOT NULL,
	[CONTACT_NO] [nvarchar](50) NULL,
	[EMAIL_ADDRESS] [nvarchar](50) NOT NULL,
	[LOGIN_PASWD] [nvarchar](50) NOT NULL,
	[USER_IMG] [nvarchar](100) NULL,
	[LAST_LOGIN] [datetime] NULL,
	[LAST_PASWD_CHANGED] [datetime] NULL,
	[WELCOME_TEXT] [nvarchar](100) NULL,
	[LOGIN_TOKEN] [nvarchar](100) NULL,
	[DEFAULT_ROLE] [nvarchar](50) NOT NULL,
	[IS_ACTIVE] [bit] NULL,
	[CREATED_USER] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[UPDATED_USER] [nvarchar](50) NULL,
	[UPDATED_DATE] [datetime] NULL,
	[REVISION_NO] [int] NULL,
 CONSTRAINT [PK_AP_USERS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AP_ROLES] ([ID], [ROLE_NAME], [ROLE_DESC], [IS_ACTIVE], [CREATED_USER], [CREATED_DATE], [UPDATED_USER], [UPDATED_DATE], [REVISION_NO]) VALUES (N'admin', N'admin', NULL, 1, NULL, CAST(N'2025-03-08T14:52:06.740' AS DateTime), NULL, CAST(N'2025-03-08T14:52:06.740' AS DateTime), 0)
GO
INSERT [dbo].[AP_USERS] ([ID], [USER_CODE], [USER_NAME], [DESIGNATION], [CONTACT_NO], [EMAIL_ADDRESS], [LOGIN_PASWD], [USER_IMG], [LAST_LOGIN], [LAST_PASWD_CHANGED], [WELCOME_TEXT], [LOGIN_TOKEN], [DEFAULT_ROLE], [IS_ACTIVE], [CREATED_USER], [CREATED_DATE], [UPDATED_USER], [UPDATED_DATE], [REVISION_NO]) VALUES (N'1', NULL, N'admin', N'admin', N'admin', N'admin@ap.com', N'0', NULL, CAST(N'2025-03-08T14:50:43.020' AS DateTime), CAST(N'2025-03-08T14:04:46.527' AS DateTime), N'Welcome', N'PmllND5jyi7CXrBojVpKj+B+F2By3WHQtayFy/FIG64ZK0XG5D', N'Admin', 1, NULL, CAST(N'2025-03-08T14:04:46.527' AS DateTime), N'1', CAST(N'2025-03-08T14:50:43.117' AS DateTime), 10)
GO
ALTER TABLE [dbo].[AP_ROLES] ADD  CONSTRAINT [DF_AP_ROLES_IS_ACTIVE]  DEFAULT ((1)) FOR [IS_ACTIVE]
GO
ALTER TABLE [dbo].[AP_ROLES] ADD  CONSTRAINT [DF_AP_ROLES_CREATED_DATE]  DEFAULT (getdate()) FOR [CREATED_DATE]
GO
ALTER TABLE [dbo].[AP_ROLES] ADD  CONSTRAINT [DF_AP_ROLES_UPDATE_DATE]  DEFAULT (getdate()) FOR [UPDATED_DATE]
GO
ALTER TABLE [dbo].[AP_ROLES] ADD  CONSTRAINT [DF_AP_ROLES_REVISION_NO]  DEFAULT ((0)) FOR [REVISION_NO]
GO
ALTER TABLE [dbo].[AP_USERS] ADD  CONSTRAINT [DF_AP_USERS_LAST_LOGIN1]  DEFAULT (getdate()) FOR [LAST_LOGIN]
GO
ALTER TABLE [dbo].[AP_USERS] ADD  CONSTRAINT [DF_AP_USERS_LAST_LOGIN]  DEFAULT (getdate()) FOR [LAST_PASWD_CHANGED]
GO
ALTER TABLE [dbo].[AP_USERS] ADD  CONSTRAINT [DF_AP_USERS_WELCOME_TEXT]  DEFAULT (N'Welcome') FOR [WELCOME_TEXT]
GO
ALTER TABLE [dbo].[AP_USERS] ADD  CONSTRAINT [DF_AP_USERS_DEFAULT_ROLE]  DEFAULT ('user') FOR [DEFAULT_ROLE]
GO
ALTER TABLE [dbo].[AP_USERS] ADD  CONSTRAINT [DF_AP_USERS_IS_ACTIVE]  DEFAULT ((1)) FOR [IS_ACTIVE]
GO
ALTER TABLE [dbo].[AP_USERS] ADD  CONSTRAINT [DF_AP_USERS_CREATED_DATE]  DEFAULT (getdate()) FOR [CREATED_DATE]
GO
ALTER TABLE [dbo].[AP_USERS] ADD  CONSTRAINT [DF_AP_USERS_UPDATED_DATE]  DEFAULT (getdate()) FOR [UPDATED_DATE]
GO
ALTER TABLE [dbo].[AP_USERS] ADD  CONSTRAINT [DF_AP_USERS_REVISION_NO]  DEFAULT ((0)) FOR [REVISION_NO]
GO
/****** Object:  StoredProcedure [dbo].[SP_AP_ROLES]    Script Date: 3/8/2025 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_AP_ROLES]
    @Action NVARCHAR(50),
    @Id NVARCHAR(50) = NULL,
    @RoleName NVARCHAR(50) = NULL,
    @RoleDesc NVARCHAR(50) = NULL,
    @IsActive BIT = 1,
    @UserId NVARCHAR(50) = NULL,
    @P_SUCCESS BIT OUTPUT,
    @P_MSG NVARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF @Action = 'INSERT'
        BEGIN
            IF EXISTS (SELECT 1 FROM AP_ROLES WHERE ROLE_NAME = @RoleName)
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'A role with the same name already exists.';
                RETURN;
            END
			BEGIN
				SET @Id = (SELECT ISNULL(MAX(ID),1)+1 FROM AP_ROLES)
			END
            INSERT INTO AP_ROLES (
                ID, ROLE_NAME, ROLE_DESC, IS_ACTIVE, CREATED_USER, CREATED_DATE, REVISION_NO
            )
            VALUES (
                @Id, @RoleName, @RoleDesc, 1, @UserId, GETDATE(), 1
            );

            SET @P_SUCCESS = 1;
            SET @P_MSG = 'Insert successful.';
        END
        ELSE IF @Action = 'UPDATE'
        BEGIN
            IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for update.';
                RETURN;
            END

            UPDATE AP_ROLES
            SET 
                ROLE_NAME = @RoleName,
                ROLE_DESC = @RoleDesc,
                IS_ACTIVE = @IsActive,
                UPDATED_USER = @UserId,
                UPDATED_DATE = GETDATE(),
                REVISION_NO = REVISION_NO + 1
            WHERE ID = @Id;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found to update.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Update successful.';
            END
        END
        ELSE IF @Action = 'DELETE'
        BEGIN
            IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for delete.';
                RETURN;
            END

            DELETE FROM AP_ROLES
            WHERE ID = @Id;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found to delete.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Delete successful.';
            END
        END
        ELSE IF @Action = 'GETBYID'
        BEGIN
            IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for get by ID.';
                RETURN;
            END

            SELECT 
                ID AS Id,ROLE_NAME AS RoleName,ROLE_DESC AS RoleDesc,IS_ACTIVE AS IsActive,CREATED_USER AS UserId,CREATED_DATE AS CreatedDate,UPDATED_USER AS UpdatedUser,UPDATED_DATE AS UpdatedDate,REVISION_NO AS RevisionNo
            FROM AP_ROLES
            WHERE ID = @Id;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found with the specified ID.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Record retrieved successfully.';
            END
        END
        ELSE IF @Action = 'GETALL'
        BEGIN
            SELECT 
                ID AS Id,ROLE_NAME AS RoleName,ROLE_DESC AS RoleDesc,IS_ACTIVE AS IsActive,CREATED_USER AS UserId,CREATED_DATE AS CreatedDate,UPDATED_USER AS UpdatedUser,UPDATED_DATE AS UpdatedDate,REVISION_NO AS RevisionNo
            FROM AP_ROLES;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No records found.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Records retrieved successfully.';
            END
        END
        ELSE IF @Action = 'GETALLACTIVE'
        BEGIN
            SELECT 
                ID AS Id,ROLE_NAME AS RoleName,ROLE_DESC AS RoleDesc,IS_ACTIVE AS IsActive,CREATED_USER AS UserId,CREATED_DATE AS CreatedDate,UPDATED_USER AS UpdatedUser,UPDATED_DATE AS UpdatedDate,REVISION_NO AS RevisionNo
            FROM AP_ROLES
			WHERE IS_ACTIVE = 1
			ORDER BY ROLE_NAME;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No records found.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Records retrieved successfully.';
            END
        END
        ELSE IF @Action = 'GETCLASSICMENUBYROLEID'
        BEGIN
            SELECT CM.ID, CM.MENU_NAME, CM.MENU_ICON, CM.PARENT_NODE, CM.MENU_COLOR,ISNULL(MR.IS_ACTIVE,0)IS_ACTIVE
			FROM AP_CLASSIC_MENU CM
			LEFT JOIN AP_MENU_ROLE MR ON CM.ID=MR.MENU_ID
			AND MR.ROLE_ID = @Id
			ORDER BY CM.ORDER_BY;
            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No records found.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Records retrieved successfully.';
            END
        END
        ELSE
        BEGIN
            SET @P_SUCCESS = 0;
            SET @P_MSG = 'Invalid Action. Use insert, update, delete, getbyid, or getall.';
        END
    END TRY
    BEGIN CATCH
        SET @P_SUCCESS = 0;
        SET @P_MSG = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AP_USERS]    Script Date: 3/8/2025 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AP_USERS]
    @Action NVARCHAR(50),
    @Id NVARCHAR(50) = NULL,
    @UserCode NVARCHAR(50) = NULL,
    @UserName NVARCHAR(50) = NULL,
    @Designation NVARCHAR(50) = NULL,
    @ContactNo NVARCHAR(50) = NULL,
    @EmailAddress NVARCHAR(50) = NULL,
    @LoginPaswd NVARCHAR(50) = NULL,
    @UserImg NVARCHAR(100) = NULL,
    @LastLogin DATETIME = NULL,
    @LastPaswdChanged DATETIME = NULL,
    @WelcomeText NVARCHAR(50) = NULL,
	@LoginToken NVARCHAR(50) = NULL,
    @IsActive BIT = 1,
    @UserId NVARCHAR(50) = NULL,
    @P_SUCCESS BIT OUTPUT,
    @P_MSG NVARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF @Action = 'INSERT'
        BEGIN
            IF EXISTS (SELECT 1 FROM AP_USERS WHERE EMAIL_ADDRESS = @EmailAddress)
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'A user with the same EMAIL already exists.';
                RETURN;
            END
            BEGIN
                SET @Id = (SELECT ISNULL(MAX(CAST(ID AS INT)), 0) + 1 FROM AP_USERS);
            END
            INSERT INTO AP_USERS (
                ID, USER_CODE, USER_NAME, DESIGNATION, CONTACT_NO, EMAIL_ADDRESS, LOGIN_PASWD, USER_IMG, WELCOME_TEXT, IS_ACTIVE, CREATED_USER, CREATED_DATE, REVISION_NO
            )
            VALUES (
                @Id, @UserCode, @UserName, @Designation, @ContactNo, @EmailAddress, '123456', '-',  @WelcomeText, 1, @UserId, GETDATE(), 1
            );

            SET @P_SUCCESS = 1;
            SET @P_MSG = 'Insert successful.';
        END
        ELSE IF @Action = 'UPDATE'
        BEGIN
            IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for update.';
                RETURN;
            END
			IF EXISTS (SELECT 1 FROM AP_USERS WHERE EMAIL_ADDRESS = @EmailAddress AND ID != @Id)
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'A user with the same EMAIL already exists.';
                RETURN;
            END
            UPDATE AP_USERS
            SET 
                USER_CODE = @UserCode,
                USER_NAME = @UserName,
                DESIGNATION = @Designation,
                CONTACT_NO = @ContactNo,
                EMAIL_ADDRESS = @EmailAddress,
                --LOGIN_PASWD = @LoginPaswd,
                --USER_IMG = @UserImg,
                --LAST_LOGIN = @LastLogin,
                --LAST_PASWD_CHANGED = @LastPaswdChanged,
                WELCOME_TEXT = @WelcomeText,
                IS_ACTIVE = @IsActive,
                UPDATED_USER = @UserId,
                UPDATED_DATE = GETDATE(),
                REVISION_NO = REVISION_NO + 1
            WHERE ID = @Id;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found to update.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Update successful.';
            END
        END
        ELSE IF @Action = 'DELETE'
        BEGIN
            IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for delete.';
                RETURN;
            END

            DELETE FROM AP_USERS
            WHERE ID = @Id;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found to delete.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Delete successful.';
            END
        END
        ELSE IF @Action = 'GETBYID'
        BEGIN
            IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for get by ID.';
                RETURN;
            END
			--LOGIN_PASWD AS LoginPaswd,
            SELECT 
                ID AS Id, USER_CODE AS UserCode, USER_NAME AS UserName, DESIGNATION AS Designation, CONTACT_NO AS ContactNo, 
                EMAIL_ADDRESS AS EmailAddress,  USER_IMG AS UserImg, LAST_LOGIN AS LastLogin, 
                LAST_PASWD_CHANGED AS LastPaswdChanged, WELCOME_TEXT AS WelcomeText, IS_ACTIVE AS IsActive, 
                CREATED_USER AS CreatedUser, CREATED_DATE AS CreatedDate, UPDATED_USER AS UpdatedUser, UPDATED_DATE AS UpdatedDate, REVISION_NO AS RevisionNo
            FROM AP_USERS
            WHERE ID = @Id;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found with the specified ID.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Record retrieved successfully.';
            END
        END
        ELSE IF @Action = 'GETALL'
        BEGIN
		-- LOGIN_PASWD AS LoginPaswd,
            SELECT 
                ID AS Id, USER_CODE AS UserCode, USER_NAME AS UserName, DESIGNATION AS Designation, CONTACT_NO AS ContactNo, 
                EMAIL_ADDRESS AS EmailAddress, USER_IMG AS UserImg, LAST_LOGIN AS LastLogin, 
                LAST_PASWD_CHANGED AS LastPaswdChanged, WELCOME_TEXT AS WelcomeText, IS_ACTIVE AS IsActive, 
                CREATED_USER AS CreatedUser, CREATED_DATE AS CreatedDate, UPDATED_USER AS UpdatedUser, UPDATED_DATE AS UpdatedDate, REVISION_NO AS RevisionNo
            FROM AP_USERS;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No records found.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Records retrieved successfully.';
            END
        END
        ELSE IF @Action = 'USER_LOGIN'
        BEGIN
			IF @EmailAddress IS NULL
				BEGIN
					SET @P_SUCCESS = 0;
					SET @P_MSG = 'EmailAddress is required for update.';
					RETURN;
				END
			IF @LoginPaswd IS NULL
				BEGIN
					SET @P_SUCCESS = 0;
					SET @P_MSG = 'Login Password is required for update.';
					RETURN;
				END
            SELECT 
                ID, USER_CODE,USER_NAME, DESIGNATION,CONTACT_NO,EMAIL_ADDRESS,USER_IMG,LAST_LOGIN, 
                LAST_PASWD_CHANGED,WELCOME_TEXT,LOGIN_TOKEN,DEFAULT_ROLE,CREATED_DATE
            FROM AP_USERS
			WHERE IS_ACTIVE  = 1 AND
			EMAIL_ADDRESS = @EmailAddress AND LOGIN_PASWD = @LoginPaswd;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'User Id or Password is incorrect.';
            END
            ELSE
            BEGIN
				UPDATE AP_USERS SET LAST_LOGIN = GETDATE() WHERE IS_ACTIVE  = 1 AND EMAIL_ADDRESS = @EmailAddress AND LOGIN_PASWD = @LoginPaswd; 
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Records retrieved successfully.';
            END
        END
		ELSE IF @Action = 'CHANGE_PASSWORD'
        BEGIN
		    IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for update.';
                RETURN;
            END

			IF ( @UserName =  @LoginPaswd )
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'Update successful.';
                RETURN;
			END
			IF NOT EXISTS (SELECT 1 FROM AP_USERS WHERE ID = @Id AND LOGIN_PASWD = @UserName)
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'Old Password is incorrect.';
                RETURN;
            END
            UPDATE AP_USERS
            SET 
                LOGIN_PASWD = @LoginPaswd,
				LAST_PASWD_CHANGED = GETDATE(),
                UPDATED_USER = @UserId,
                UPDATED_DATE = GETDATE(),
                REVISION_NO = REVISION_NO + 1
            WHERE ID = @Id;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found to update.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Update successful.';
            END
        END
		ELSE IF @Action = 'RESET_PASSWORD'
        BEGIN
		    IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for update.';
                RETURN;
            END

            UPDATE AP_USERS
            SET 
                LOGIN_PASWD = @LoginPaswd,
				LAST_PASWD_CHANGED = GETDATE(),
                UPDATED_USER = @UserId,
                UPDATED_DATE = GETDATE(),
                REVISION_NO = REVISION_NO + 1
            WHERE ID = @Id;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found to update.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Update successful.';
            END
        END
		ELSE IF @Action = 'UPDATE_LOGIN_TOKEN'
        BEGIN
		    IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for update.';
                RETURN;
            END

            UPDATE AP_USERS
            SET 
                LOGIN_TOKEN = @LoginToken,
                UPDATED_USER = @UserId,
                UPDATED_DATE = GETDATE(),
                REVISION_NO = REVISION_NO + 1
            WHERE ID = @Id;

            IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found to update.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Update successful.';
            END
        END
		ELSE IF @Action = 'GET_LOGIN_TOKEN'
        BEGIN
		    IF @Id IS NULL
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'ID is required for token.';
                RETURN;
            END

            SELECT * FROM AP_USERS
            WHERE ID = @Id;

			IF @@ROWCOUNT = 0
            BEGIN
                SET @P_SUCCESS = 0;
                SET @P_MSG = 'No record found with the specified ID.';
            END
            ELSE
            BEGIN
                SET @P_SUCCESS = 1;
                SET @P_MSG = 'Record retrieved successfully.';
            END
        END
        ELSE
        BEGIN
            SET @P_SUCCESS = 0;
            SET @P_MSG = 'Invalid Action. Use insert, update, delete, getbyid, or getall.';
        END
    END TRY
    BEGIN CATCH
        SET @P_SUCCESS = 0;
        SET @P_MSG = ERROR_MESSAGE();
    END CATCH
END
GO
