
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/10/2022 19:13:16
-- Generated from EDMX file: C:\Users\serife.gokdas\Desktop\şerife\Projeler\9.11.22 British Time\9.11.22 British Time -model first-entity framework-\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BritishTime];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TeachersStudents]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudentsSet] DROP CONSTRAINT [FK_TeachersStudents];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentsLessons]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LessonsSet] DROP CONSTRAINT [FK_StudentsLessons];
GO
IF OBJECT_ID(N'[dbo].[FK_TeachersLessons]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LessonsSet] DROP CONSTRAINT [FK_TeachersLessons];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TeachersSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TeachersSet];
GO
IF OBJECT_ID(N'[dbo].[StudentsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentsSet];
GO
IF OBJECT_ID(N'[dbo].[StaffsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StaffsSet];
GO
IF OBJECT_ID(N'[dbo].[LessonsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LessonsSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TeachersSet'
CREATE TABLE [dbo].[TeachersSet] (
    [TeacherNo] int IDENTITY(1,1) NOT NULL,
    [TeacherName] nvarchar(max)  NOT NULL,
    [TeacherPhone] nvarchar(max)  NOT NULL,
    [TeacherMail] nvarchar(max)  NOT NULL,
    [TeacherBranch] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StudentsSet'
CREATE TABLE [dbo].[StudentsSet] (
    [StudentNo] int IDENTITY(1,1) NOT NULL,
    [StudentName] nvarchar(max)  NOT NULL,
    [StudentPhone] nvarchar(max)  NOT NULL,
    [StudentMail] nvarchar(max)  NOT NULL,
    [TeachersTeacherNo] int  NOT NULL
);
GO

-- Creating table 'StaffsSet'
CREATE TABLE [dbo].[StaffsSet] (
    [StaffNo] int IDENTITY(1,1) NOT NULL,
    [StaffName] nvarchar(max)  NOT NULL,
    [StaffMail] nvarchar(max)  NOT NULL,
    [StaffPassword] nvarchar(max)  NOT NULL,
    [StaffPhone] int  NOT NULL
);
GO

-- Creating table 'LessonsSet'
CREATE TABLE [dbo].[LessonsSet] (
    [LessonNo] int IDENTITY(1,1) NOT NULL,
    [Speech] nvarchar(max)  NOT NULL,
    [BusinessEnglish] nvarchar(max)  NOT NULL,
    [YDSCourse] nvarchar(max)  NOT NULL,
    [ToeflCourse] nvarchar(max)  NOT NULL,
    [IeltsCourse] nvarchar(max)  NOT NULL,
    [StudentsStudentNo] int  NOT NULL,
    [TeachersTeacherNo] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [TeacherNo] in table 'TeachersSet'
ALTER TABLE [dbo].[TeachersSet]
ADD CONSTRAINT [PK_TeachersSet]
    PRIMARY KEY CLUSTERED ([TeacherNo] ASC);
GO

-- Creating primary key on [StudentNo] in table 'StudentsSet'
ALTER TABLE [dbo].[StudentsSet]
ADD CONSTRAINT [PK_StudentsSet]
    PRIMARY KEY CLUSTERED ([StudentNo] ASC);
GO

-- Creating primary key on [StaffNo] in table 'StaffsSet'
ALTER TABLE [dbo].[StaffsSet]
ADD CONSTRAINT [PK_StaffsSet]
    PRIMARY KEY CLUSTERED ([StaffNo] ASC);
GO

-- Creating primary key on [LessonNo] in table 'LessonsSet'
ALTER TABLE [dbo].[LessonsSet]
ADD CONSTRAINT [PK_LessonsSet]
    PRIMARY KEY CLUSTERED ([LessonNo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TeachersTeacherNo] in table 'StudentsSet'
ALTER TABLE [dbo].[StudentsSet]
ADD CONSTRAINT [FK_TeachersStudents]
    FOREIGN KEY ([TeachersTeacherNo])
    REFERENCES [dbo].[TeachersSet]
        ([TeacherNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeachersStudents'
CREATE INDEX [IX_FK_TeachersStudents]
ON [dbo].[StudentsSet]
    ([TeachersTeacherNo]);
GO

-- Creating foreign key on [StudentsStudentNo] in table 'LessonsSet'
ALTER TABLE [dbo].[LessonsSet]
ADD CONSTRAINT [FK_StudentsLessons]
    FOREIGN KEY ([StudentsStudentNo])
    REFERENCES [dbo].[StudentsSet]
        ([StudentNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentsLessons'
CREATE INDEX [IX_FK_StudentsLessons]
ON [dbo].[LessonsSet]
    ([StudentsStudentNo]);
GO

-- Creating foreign key on [TeachersTeacherNo] in table 'LessonsSet'
ALTER TABLE [dbo].[LessonsSet]
ADD CONSTRAINT [FK_TeachersLessons]
    FOREIGN KEY ([TeachersTeacherNo])
    REFERENCES [dbo].[TeachersSet]
        ([TeacherNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeachersLessons'
CREATE INDEX [IX_FK_TeachersLessons]
ON [dbo].[LessonsSet]
    ([TeachersTeacherNo]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------