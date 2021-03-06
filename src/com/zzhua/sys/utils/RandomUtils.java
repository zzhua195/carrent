package com.zzhua.sys.utils;

import com.zzhua.sys.constant.SysContast;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * 随机工具类
 * @author LJH
 *
 */
public class RandomUtils {
	
	
	private static SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat sdf2=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private static Random random=new Random();
	
	/**
	 * 得到当前日期
	 */
	public static String getCurrentDateForString() {
		return sdf1.format(new Date());
	}
	
	
	/**
	 * 生成文件名使用时间+4位随机数
	 * @param suffix 文件名称
	 */
	public static String createFileNameUseTime(String fileName) {
		String fileSuffix=fileName.substring(fileName.lastIndexOf("."),fileName.length());
		String time=sdf2.format(new Date());
		Integer num=random.nextInt(9000)+1000;
		return time+num+fileSuffix;
	}
	
	/**
	 * 生成文件名使用UUID
	 * @param suffix 文件名称
	 */
	public static String createFileNameUseUUID(String fileName) {
		String fileSuffix=fileName.substring(fileName.lastIndexOf("."),fileName.length());
		return UUID.randomUUID().toString().replace("-", "").toUpperCase()+fileSuffix;
	}

    public static String getRentid() {

        return SysContast.DEFAULT_RENT_PREFIX+"_"+sdf2.format(new Date())+"_"+(10000+random.nextInt(90000));
    }

    public static String generateCheckId() {
	    return SysContast.DEFAULT_CHECK_PREFIX+"_"+sdf2.format(new Date())+"_"+(10000+random.nextInt(90000));
    }
}

