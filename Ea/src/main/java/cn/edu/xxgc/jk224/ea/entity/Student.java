package cn.edu.xxgc.jk224.ea.entity;

import java.io.Serializable;

public class Student implements Serializable {

    private static final long serialVersionUID = 4430925949539139087L;
    private String id;
    private String name;
    private String sex;
    private String college;
    private String major;

    public Student() {
    }

    public Student(String id, String name, String sex, String college, String major) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.college = college;
        this.major = major;
    }

    /**
     * 获取
     *
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置
     *
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取
     *
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     *
     * @return sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * 设置
     *
     * @param sex
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * 获取
     *
     * @return college
     */
    public String getCollege() {
        return college;
    }

    /**
     * 设置
     *
     * @param college
     */
    public void setCollege(String college) {
        this.college = college;
    }

    /**
     * 获取
     *
     * @return major
     */
    public String getMajor() {
        return major;
    }

    /**
     * 设置
     *
     * @param major
     */
    public void setMajor(String major) {
        this.major = major;
    }

    public String toString() {
        return "id = " + id + ", name = " + name + ", sex = " + sex + ", college = " + college + ", major = " + major + "}";
    }
}
