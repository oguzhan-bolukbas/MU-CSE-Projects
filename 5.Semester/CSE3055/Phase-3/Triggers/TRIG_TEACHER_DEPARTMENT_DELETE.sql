USE [DATABASE_OF_GATEM]
GO
/****** Object:  Trigger [dbo].[TRIG_TEACHER_DEPARTMENT_DELETE]    Script Date: 05-Jan-18 16:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TRIG_TEACHER_DEPARTMENT_DELETE] ON [dbo].[TEACHER_DEPARTMENT]
  FOR DELETE
  AS
    DECLARE @max INT
    DECLARE @min INT
    SELECT @max=max(_IDX),@min=min(_IDX) FROM deleted
    UPDATE TEACHER_DEPARTMENT_LOG SET _Deleted=1,_UpdateDate=GETDATE()
      WHERE @max=_EndIndex AND @min=_BeginIndex AND _deleted=0