package com.nesh.util;

import static com.google.appengine.api.utils.SystemProperty.environment;

import com.google.appengine.api.utils.SystemProperty;
import com.google.apphosting.api.ApiProxy;
public class ImageUtil {


	private static SystemProperty.Environment.Value env = environment.value();
	
	private static String appId = ApiProxy.getCurrentEnvironment().getAppId();
	
	public static String testRelationTypeId;
	public static String roleAdminId ;
	
	static{
		testRelationTypeId = "38e78d05-360c-47f0-8832-0879bd3e7740";
		roleAdminId = "0427565c-ed10-4811-bd21-c75176bb15d2";
	}
	public static String getTestRelationTypeId() {
		return testRelationTypeId;
	}
	public static String getRoleAdminId() {
		return roleAdminId;
	}


}
