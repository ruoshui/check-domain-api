//弹出内容层,弹出标题title 内容content 宽度w 高度h
function openContent(title, content, w, h) {

	if(title == null || title == '') {
		title = false;
	};
	if(content == null || content == '') {
		content = "没有内容";
	};
	if(w == null || w == '') {
		w = ($(window).width() * 0.9);
	};
	if(h == null || h == '') {
		h = ($(window).height() - 50);
	};
	layer.open({
		type: 1,
		title: title,
		skin: 'layui-layer-rim', //加上边框
		area: [w + 'px', h + 'px'],
		shadeClose: true, //开启遮罩关闭,点击其他区域关闭
		closeBtn: 0, //不显示关闭按钮
		anim: 4, //0-6的动画形式，-1不开启
		content: "<div style='margin:10px;'>" + content + "</div>"
	});

}

//弹出图片层,弹出图片地址 src
function showImg(src) {
	layer.photos({
		photos: {
			"title": "查看头像" //相册标题
			,"data": [{
				"src": src //原图地址
			}]
		}
		,shade: 0.5
		,closeBtn: 1
		,anim: 5
	});
}

//弹出iframe层,层标题title, 弹出链接url, 宽度w, 高度h
function openUrl(title, url, w, h) {
	if(title == null || title == '') {
		title = false;
	};
	if(url == null || url == '') {
		url = "http://baidu.com";
	};
	if(w == null || w == '') {
		w = ($(window).width() * 0.9);
	};
	if(h == null || h == '') {
		h = ($(window).height() - 50);
	};
	layer.open({
		type: 2,
		area: [w + 'px', h + 'px'],
		fix: false, //不固定
		maxmin: true,
		shadeClose: true, //开启遮罩关闭,点击其他区域关闭
		shade: 0.4,
		anim: 4, //0-6的动画形式，-1不开启
		title: title,
		content: url
	});

}

function openTips(content, idorclass, mode, color) {

	if(content == null || content == '') {
		content = '没有内容';
	}
	if(idorclass == null || idorclass == '') {
		idorclass = this;
	}
	if(mode == null || mode == '') {
		mode = 2;
	}
	if(color == null || color == '') {
		color = '#FF5722';
	}

	layer.tips(content, idorclass, {
		tips: [mode, color] //还可配置颜色
	});

}

function imagesList(cla) {
	layer.open({
		type: 2,
		area: ['80%', '90%'],
		fixed: false, //不固定
		maxmin: true,
		content: '/admin/image/index?cla='+cla
	});
}

//删除
function del(table, id) {
	if(table == null || table == '') {
		layer.msg('缺少参数table', {
			icon: 2
		});
	};
	if(id == null || id == '') {
		layer.msg('缺少参数id', {
			icon: 2
		});
	};
	layer.confirm('真的要删除吗？', {
		skin: 'layui-layer-lan',
		closeBtn: 0,
		anim: 6
	}, function() {
		$.get("del?t=" + table + "&id=" + id, function(res) {
			layer.msg(res.msg, {time:1500}, function() {
				// window.parent.location.reload();
				window.location.reload();
			});
		}, 'json');
	});
}

layui.use(['table', 'layer', 'form', 'element', 'layedit', 'upload', 'laydate'], function() {
	var table = layui.table,
		layer = layui.layer,
		form = layui.form,
		element = layui.element,
		layedit = layui.layedit,
		upload = layui.upload,
		laydate = layui.laydate,
		$ = layui.jquery;


	laydate.render({
		elem: '#update_time',type: 'datetime'
	});
	laydate.render({
		elem: '#expire_time',type: 'datetime'
	});

	// 添加数据通用
	form.on('submit(create)', function(data) {
		$.post("", data.field, function(res) {
			if(res.code == 1) {
				layer.msg(res.msg, {icon: 1,time:1500}, function() {
					location.href = "index";
				});
			} else {
				layer.msg(res.msg, {icon: 2,time:1500});
			}
		}, 'json');
		return false;
	});


	// 编辑数据通用（需要在网页里设置好 editId 是编辑的id）
	form.on('submit(editinfo)', function(data) {
		$.post("?id="+editId, data.field, function(res) {
			if(res.code == 1) {
				layer.msg(res.msg, {icon: 1,time:1500}, function() {
					location.href = "index";
				});
			} else {
				layer.msg(res.msg, {icon: 2,time:1500});
			}
		}, 'json');
		return false;
	});


	// 上传图片
	upload.render({
		elem: '.upload-button',
		url: "/admin/upload/images",
		method: 'post',
		accept: 'images', //上传类型

		before: function(input) {
			layer.msg('文件上传中...', {
				time: 1000
			});
		},
		done: function(res, index, upload) {
			var obj = this.item;
			if(res.code > 0) {
				layer.msg(res.msg);
				return false;
			}

			layer.msg(res.msg);

			var upin = $(obj).parents('.upload').find('.upload-input');
			upim = $(obj).parents('.upload').find('.upload-img');
			upin.val(res.data.src);
			upim.attr('src', res.data.src);
		}
	});

	// 上传图片到网络
	upload.render({
		elem: '.upload-network',
		url: "/admin/upload/images",
		method: 'post',
		accept: 'images', //上传类型

		before: function(input) {
			layer.msg('文件上传中...', {
				time: 1000
			});
		},
		done: function(res, index, upload) {
			var obj = this.item;
			if(res.code > 0) {
				layer.msg(res.msg);
				return false;
			}

			$.get('https://api.uomg.com/api/image.ali', {imgurl: res.data.url}, function (urldata) {

				layer.msg('成功上传到网络', {icon:1});
				var upin = $(obj).parents('.upload').find('.upload-input');
				upim = $(obj).parents('.upload').find('.upload-img');
				upin.val(urldata.imgurl);
				upim.attr('src', urldata.imgurl);

			}, 'json');

		}
	});


	// 上传图片
	layedit.set({
		uploadImage: {
			url: "/admin/upload/images",
			type: 'post', //默认post
			accept: 'images' //支持所有类型文件
		}
	});

	// 上传视频
	upload.render({
		elem: '.upload-video',
		url: "/admin/upload/video",
		method: 'post',
		accept: 'video', //上传类型

		before: function(input) {
			layer.msg('文件上传中...可能需要一点时间，请等待...不要进行其他操作');
		},
		done: function(res, index, upload) {
			var obj = this.item;
			if(res.code != 0) {
				layer.msg(res.msg);
				return false;
			} else {
				layer.msg(res.msg);
			}

			var upin = $(obj).parents('.upvideo').find('.upload-input');

			upin.val(res.data.src);

		}
	});



	//创建一个编辑器
	var editIndex = layedit.build('editor');

	//自定义验证规则
	form.verify({
		content: function(value){
			layedit.sync(editIndex);
		}
	});

	//监听权限操作
	form.on('switch(switchAdmin)', function(obj) {
		$.get($(this).attr('data-href'), function(res) {
			if(res.code == 1) {
				layer.tips(res.msg, obj.othis, {
					tips: [4, '#5FB878']
				});
			} else {
				layer.tips(res.msg, obj.othis, {
					tips: [4, '#FF5722']
				});
			}
		}, 'json');
	});

	//监听状态操作
	form.on('switch(switchStatus)', function(obj) {
		$.get($(this).attr('data-href'), function(res) {
			if(res.code == 1) {
				layer.tips(res.msg, obj.othis, {
					tips: [2, '#5FB878']
				});
			} else {
				layer.tips(res.msg, obj.othis, {
					tips: [2, '#FF5722']
				});
			}
		}, 'json');
	});

});



