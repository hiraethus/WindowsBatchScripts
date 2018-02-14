if not exist Y:\ (
	msg "%username%" Y: drive is not mounted, please check your config and try again
)

if exist Y:\ (
	REM update archive - copy all files from disk and don't purge those deleted on disk

	if exist Y:\secure.7z (
		7z u -up0q1r2x2y2w2!Y:\secure.7z %HOMEDRIVE%%HOMEPATH% -p%BACKUP_PASSWORD%
	)

	if not exist Y:\secure.7z (
		msg "%username%" Archiving
		7z a C:\Backup\secure.7z %HOMEDRIVE%%HOMEPATH% -p%BACKUP_PASSWORD%
		ROBOCOPY C:\Backup Y:\
	)

	msg "%username%" Backup to Y: successful
)
