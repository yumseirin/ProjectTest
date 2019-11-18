package com.vo;

import java.util.List;

/**
 * @Description: 树所需要的实体类
    根据实体类生成一个JSON串，前台进行解析生成树, JSON的格式：
    
	     [
	          {"id":"01","text":"一班","children":[{"id":"001","text":"张一","children":null},
	                                              {"id":"002","text":"张二","children":null}
	                                              ]},
	          {"id":"02","text":"二班","children":[{"id":"003","text":"张三","children":null}]}, 
	          {"id":"03","text":"三班","children":null} 
	     ]
	     
 */
public class Tree {

	private String id;
	private String text;
	private List<Tree> children;
  
    
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<Tree> getChildren() {
		return children;
	}
	public void setChildren(List<Tree> children) {
		this.children = children;
	}
	
}

