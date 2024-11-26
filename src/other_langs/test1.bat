@Echo Off
FOR /f "tokens=1,2,3,*" %%A in ("alpha beta gamma delta epsilon") DO echo A:[%%A]  B:[%%B]  C:[%%C]  D:[%%D] %%F