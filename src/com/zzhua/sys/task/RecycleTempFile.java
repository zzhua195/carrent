package com.zzhua.sys.task;

import com.zzhua.sys.utils.AppFileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;


/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/24
 * <p>
 * Description:
 */

@PropertySource(value = "classpath:task.properties")
@Component
@EnableScheduling
public class RecycleTempFile {

    @Value("${default_temp_suffix}")
    private String suffix;

    @Scheduled(cron = "${delete_time}")
    public void recycleTempFile() {
        String parentPath = AppFileUtils.PATH;
        deleteFiles(new File(parentPath));
        System.out.println("---------清理成功---------");
    }

    private void deleteFiles(File file) {
        if(file!=null){
            File[] files = file.listFiles();
            if(files!=null&&files.length>0){
                for (int i = 0; i < files.length; i++) {
                    if(files[i].isFile()&&files[i].getName().endsWith(suffix)){
                        files[i].delete();
                    }else{
                        deleteFiles(files[i]);
                    }
                }
            }
        }
    }

}
