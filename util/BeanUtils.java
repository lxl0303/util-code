package com.ptmind.api.base.util;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.DynaBean;
import org.apache.commons.beanutils.DynaProperty;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.Map;

public class BeanUtils {

    private static Logger log = LoggerFactory.getLogger(BeanUtils.class);
    private static BeanUtilsBean utilsBean = BeanUtilsBean.getInstance();

    @SuppressWarnings("rawtypes")
    public static void copyPropertiesSkipNull(Object dest, Object orig) throws IllegalAccessException, InvocationTargetException {
        if (dest == null) {
            throw new IllegalArgumentException("目标对象不能为空");
        }
        if (orig == null) {
            throw new IllegalArgumentException("源对象不能为空");
        }
        if (log.isDebugEnabled()) {
            log.debug("BeanUtils.copyProperties(" + dest + ", " + orig + ")");
        }
        // Copy the properties, converting as necessary
        if (orig instanceof DynaBean) {
            DynaProperty[] origDescriptors = ((DynaBean) orig).getDynaClass().getDynaProperties();
            for (int i = 0; i < origDescriptors.length; i++) {
                String name = origDescriptors[i].getName();
                // Need to check isReadable() for WrapDynaBean
                // (see Jira issue# BEANUTILS-61)
                if (utilsBean.getPropertyUtils().isReadable(orig, name) && isNotNull(orig, name) && utilsBean.getPropertyUtils().isWriteable(dest, name)) {
                    Object value = ((DynaBean) orig).get(name);
                    utilsBean.copyProperty(dest, name, value);
                }
            }
        } else if (orig instanceof Map) {
            Iterator entries = ((Map) orig).entrySet().iterator();
            while (entries.hasNext()) {
                Map.Entry entry = (Map.Entry) entries.next();
                String name = (String) entry.getKey();
                if (utilsBean.getPropertyUtils().isWriteable(dest, name) && isNotNull(orig, name)) {
                    utilsBean.copyProperty(dest, name, entry.getValue());
                }
            }
        } else /* if (orig is a standard JavaBean) */ {
            PropertyDescriptor[] origDescriptors = utilsBean.getPropertyUtils().getPropertyDescriptors(orig);
            for (int i = 0; i < origDescriptors.length; i++) {
                String name = origDescriptors[i].getName();
                if ("class".equals(name)) {
                    continue; // No point in trying to set an object's class
                }
                if (utilsBean.getPropertyUtils().isReadable(orig, name) && isNotNull(orig, name) && utilsBean.getPropertyUtils().isWriteable(dest, name)) {
                    try {
                        Object value = utilsBean.getPropertyUtils().getSimpleProperty(orig, name);
                        utilsBean.copyProperty(dest, name, value);
                    } catch (NoSuchMethodException e) {
                        // Should not happen
                    }
                }
            }
        }
    }

    protected static boolean isNotNull(Object bean, String name) {
        // Validate method parameters
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException("No name specified for bean class '" + bean.getClass() + "'");
        }
        Object nestedBean = null;
        try {
            nestedBean = utilsBean.getProperty(bean, name);
        } catch (IllegalAccessException e) {
            return false;
        } catch (InvocationTargetException e) {
            return false;
        } catch (NoSuchMethodException e) {
            return false;
        }
        return nestedBean != null;
    }
}
