
copy /B /Y ..\sql\*.sql mysql\db\
copy /B /Y ..\ruoyi-auth\target\ruoyi-auth.jar /V ruoyi\auth\jar\ruoyi-auth.jar
copy /B /Y ..\ruoyi-gateway\target\ruoyi-gateway.jar /V ruoyi\gateway\jar\ruoyi-gateway.jar
copy /B /Y ..\ruoyi-modules\ruoyi-file\target\ruoyi-modules-file.jar /V ruoyi\modules\file\jar\ruoyi-modules-file.jar
copy /B /Y ..\ruoyi-modules\ruoyi-gen\target\ruoyi-modules-gen.jar /V ruoyi\modules\gen\jar\ruoyi-modules-gen.jar
copy /B /Y ..\ruoyi-modules\ruoyi-job\target\ruoyi-modules-job.jar /V ruoyi\modules\job\jar\ruoyi-modules-job.jar
copy /B /Y ..\ruoyi-modules\ruoyi-system\target\ruoyi-modules-system.jar /V ruoyi\modules\system\jar\ruoyi-modules-system.jar
copy /B /Y ..\ruoyi-visual\ruoyi-monitor\target\ruoyi-visual-monitor.jar /V ruoyi\visual\monitor\jar\ruoyi-visual-monitor.jar
xcopy /s/e/Y ..\ruoyi-ui\dist /V nginx\html\dist