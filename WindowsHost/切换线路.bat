@echo off
set /p a=请选择是否要使用本地版本（y/n）:

if %a%==y (
	if exist %windir%\System32\drivers\etc\hosts.bak (
		copy %windir%\System32\drivers\etc\hosts.bak %windir%\System32\drivers\etc\hosts
	) else (
		copy %windir%\System32\drivers\etc\hosts %windir%\System32\drivers\etc\hosts.bak
	)
	echo. >> %windir%\System32\drivers\etc\hosts

	echo 192.168.14.70 www.zhijiao365.com >> %windir%\System32\drivers\etc\hosts
	echo 192.168.14.70 m.zhijiao365.com >> %windir%\System32\drivers\etc\hosts
	echo 192.168.14.70 sync.en100.com.cn >> %windir%\System32\drivers\etc\hosts
	echo 192.168.14.70 www.en100.com.cn >> %windir%\System32\drivers\etc\hosts
	echo 192.168.14.70 audio.yuwen100.cn >> %windir%\System32\drivers\etc\hosts
	echo 192.168.14.70 video.yuwen100.cn >> %windir%\System32\drivers\etc\hosts
	echo 192.168.14.70 video.zhijiao365.com >> %windir%\System32\drivers\etc\hosts
	echo 192.168.14.70 exam.bsccedu.com >> %windir%\System32\drivers\etc\hosts
	echo 192.168.14.70 www.yuwen100.cn >> %windir%\System32\drivers\etc\hosts
	echo 192.168.14.70 passport.bsccedu.com >> %windir%\System32\drivers\etc\hosts
) else (
	if exist %windir%\System32\drivers\etc\hosts.bak (
		copy %windir%\System32\drivers\etc\hosts.bak %windir%\System32\drivers\etc\hosts
		del %windir%\System32\drivers\etc\hosts.bak
	)
)
ipconfig /flushdns
echo "切换成功，点击任意键结束任务"
pause