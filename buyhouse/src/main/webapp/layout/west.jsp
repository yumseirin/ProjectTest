<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>

	</head>

	<body>

		<!--  ==================手风琴菜单（从Accordion（分类）里）strart==========================  
				data-options="fit:true"  加在最外层的div让最外层适合父容器
			-->
		<div id="aa" class="easyui-accordion" data-options="fit:true"
			style="width: 300px; height: 200px;">
			<div title="系统管理" data-options="iconCls:'icon-reload',selected:true"
				style="padding: 10px;">
				<!--=======折叠树DataGrid+Tree(树据表格和树) start============-->
				<ul id="tt" class="easyui-tree">

					<li>   <!-- addtab()这个方法在index.jsp中，这个方法如果放在west.jsp中，找不到不好用 -->
						<span><a onclick="addtab('员工权限管理','layout/one.jsp')">员工权限管理</a></span>
					</li>
					<li>
						<span><a onclick="addtab('角色管理','roleControl/gotoRoleList.action')">角色管理</a></span>
					</li>
				</ul>

				<!--=======折叠树end============-->
			</div>

			<div title="教育管理" data-options="iconCls:'icon-save'"
				style="overflow: auto; padding: 10px;">
				<!--=======折叠树DataGrid+Tree(树据表格和树) start============-->
				<ul id="tt" class="easyui-tree">
					<li>
						<span>首页</span>
						<ul>
							<li>
								<span>考试管理</span>
								<ul>
									<li>
										<span><a onclick="addtab('学员管理')">学员管理</a> </span>
									</li>
									<li>
										<span>成绩管理</span>
									</li>
									<li>
										<span>试卷管理</span>
									</li>
								</ul>
							</li>
							<li>
								<span>班级管理</span>
							</li>

						</ul>
					</li>
					<li>
						<span>综合</span>
					</li>
				</ul>

				<!--=======折叠树end============-->
			</div>

			<div title="课程体系">
				<ul id="tt" class="easyui-tree">
					<li>
						<span><a onclick="addtab('打印','/roleControl/gotoPrint.action')">打印</a></span>
					</li>
				</ul>
			</div>
			<div title="用户管理">
				<ul id="tt" class="easyui-tree">
					<li>
						<span><a onclick="addtab('用户管理','')">用户管理</a></span>
					</li>
				</ul>
			</div>
			<div title="区域管理">
				<ul id="tt" class="easyui-tree">

					<li>   
						<span><a onclick="addtab('区域管理','quyuControl/gotoQuyuList.action')"> 区域管理</a></span>
					</li>
					<li>
						<span>部门管理</span>
					</li>
				</ul>
			</div>

		</div>

		<!--  ==================手风琴end==========================           -->
	</body>
</html>
