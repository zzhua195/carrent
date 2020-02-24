package com.zzhua.bus.controller;

import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.utils.AppFileUtils;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.RandomUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/23
 * <p>
 * Description:
 */

@Controller
@RequestMapping("file")
public class FileControleller {

    @RequestMapping("upload")
    @ResponseBody
    public DataGridView upload(MultipartFile mf){

        // 获取文件上传的父目录
        String parentPath = AppFileUtils.PATH;
        // 判断当日的文件夹是否已创建
        String currFileName = RandomUtils.getCurrentDateForString();
        File file = new File(parentPath,currFileName );
        if(!file.exists()||file.isFile()){
            file.mkdirs();
        }
        // 获取文件的原名称，并修改名字
        String originalFilename = mf.getOriginalFilename();
        if(SysContast.DEFAULT_CAR_IMG.equals(originalFilename)){
            Map map = new HashMap();
            map.put("src",SysContast.DEFAULT_CAR_IMG);
            return new DataGridView(map);
        }
        String newFileName = RandomUtils.createFileNameUseTime(originalFilename) + SysContast.DEFAULT_TEMP_SUFFIX;
        //目标文件
        File destFile = new File(file, newFileName);
        Map map = new HashMap();
        try {
            mf.transferTo(destFile);
            map.put("src",currFileName+"/"+newFileName);
            return new DataGridView(map);
        } catch (IOException e) {
            e.printStackTrace();
            return new DataGridView(SysContast.CODE_ERROR, SysContast.UPLOAD_ERROR,(long)SysContast.ZERO,null);
        }
    }

    @RequestMapping("downloadShowFile")
    public ResponseEntity<Object> downloadShowFile(String filepath, HttpServletResponse response){
        return AppFileUtils.downloadFile(response,filepath,"");
    }


}
