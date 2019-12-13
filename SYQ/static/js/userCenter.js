$(function(){
    var username = window.localStorage.getItem('syq_user')
    // 个人资料标签单击事件
    $('.personInfo').on('click',function(){
        $('.selected').removeClass('selected')
        $('.userinfoLi').addClass('selected')
        $('#selected-title').html('个人资料')
        $('#detail-show').html('个人资料')
    })


    // 我的相册标签单击事件
    $('.personAlbums').on('click',function(){
        $('.selected').removeClass('selected')
        $('.useralbumsLi').addClass('selected')
        $('#selected-title').html('我的相册')
        // $('#detail-show').html('我的相册')
        $.ajax({
            type:'get',
            url:'/albums/'+username,
            beforeSend:function(request){
                var token = window.localStorage.getItem('syq_token');
                request.setRequestHeader('Authorization',token);
            },
            success:function(result){
                if (200==result.code){
                   albums_html = '';
                   $.each(result.data,function(i,obj){
                        albums_html+='<ul id="albums">';
                            albums_html+='<li>';
                                albums_html+='<div class="album-editor">';
                                    albums_html+='<ul class="editor-list">';
                                        albums_html+='<li><a href="">编辑相册</a></li>';
                                        albums_html+='<li><a href="">添加图片</a></li>';
                                        albums_html+='<li><a href="">删除相册</a></li>';
                                    albums_html+='</ul>';
                                albums_html+='</div>';
                                albums_html+='<div class="album-img">';
                                    albums_html+='<a class="img" href="/albums/album'+ obj.id +'" style="background-image:url('+obj.cover+'" ></a>';
                                albums_html+='</div>';
                                albums_html+='<div class="album-title">';
                                    albums_html+='<a class="title" href="/albums/album'+ obj.id +'">'+ obj.title +'</a>';
                                albums_html+='</div>';
                                albums_html+='<div class="album-owner">';
                                    albums_html+='<span class="datetime">'+ obj.created_time +'</span>'
                                albums_html+='</div>';
                            albums_html+='</li>';
                        albums_html+='</ul>'

                   })
                   albums_html+='<div id="add-album-box">';
                   albums_html+='<p>+</p>';
                   albums_html+='<span>点击添加相册</span>';
                   albums_html+='</div>';
                   $('#detail-show').html(albums_html);
                   // 添加相册事件
                   $('#add-album-box').on('click',function(){
                        window.location='/user/add_album'
                    })
                   // 相册编辑动画效果
                    $('#albums>li').on('mouseover',function(){
                        console.log('111111')
                        $(this).children('.album-editor').stop().slideDown(200);
                    })
                    $('#albums>li').on('mouseout',function(){
                        $(this).children('.album-editor').stop().slideUp(200);
                    })
                }else{
                    alert(result.error)
                }
            }
        })
    })
    


    // 我的关注标签单击事件
    $('.myB').on('click',function(){
        $('.selected').removeClass('selected')
        $('.relationbLi').addClass('selected')
        $('#selected-title').html('我的关注')
        // $('#detail-show').html('我的关注')
        $.ajax({
            type:'get',
            url:'/user/relation/my_relation',
            data:{'username':username},
            beforeSend:function(request){
                var token = window.localStorage.getItem('syq_token');
                request.setRequestHeader('Authorization',token);
            },
            success:function(result){
                if(result.code==200){
                    show_html='';
                    show_html+='<ul id="relation-list">';
                    $.each(result.data,function(i,obj){
                        show_html+='<li class="relation-info">';
                            show_html+='<div class="relation-box">';
                                if(obj.avatar){
                                    show_html+='<div class="person-avatar" style="background-image:url('+ obj.avatar +')"></div>';
                                }else{
                                    show_html+='<div class="person-avatar" style="background-image:url(/static/imgs/avatar.jpg)"></div>';
                                }
                                
                                if(obj.nickname){
                                    show_html+='<div class="person-name"><span>'+ obj.nickname +'</span></div>';
                                }else{
                                    show_html+='<div class="person-name"><span>'+ obj.username +'</span></div>';
                                }
                                show_html+='<div class="person-sign"><span>个性签名:' + obj.sign + '</span></div>';
                                show_html+='<div class="del-relation">取关</div>';
                            show_html+='</div>';
                        show_html+='</li>';
                    })
                    show_html+='</ul>'
                    $('#detail-show').html(show_html);
                }else{
                    alert(result.error);
                    window.location='/user/login'
                }
            }
        })
    })
    // 我的收藏标签单击事件
    $('.myFans').on('click',function(){
        $('.selected').removeClass('selected')
        $('.relationaLi').addClass('selected')
        $('#selected-title').html('我的收藏')
        $('#detail-show').html('我的收藏')
    })
    // 回收站标签单击事件
    $('.dustbin').on('click',function(){
        $('.selected').removeClass('selected')
        $('.dustbinLi').addClass('selected')
        $('#selected-title').html('回收站')
        $('#detail-show').html('回收站')
    })
    // 修改密码标签单击事件
    $('.modPass').on('click',function(){
        $('.selected').removeClass('selected')
        $('.modpwdLi').addClass('selected')
        $('#selected-title').html('修改密码')
        show_html='<div id="mod-pwd-box">';
            show_html+='<h2>修改密码</h2>';
            show_html+='<form action="/user/username/mod_pwd">';
                show_html+='<div>';
                    show_html+='<label for="old_pwd">旧密码:</label>';
                    show_html+='<input type="password" name="old_pwd">';
                show_html+='</div>';
                show_html+='<div>';
                    show_html+='<label for="new_pwd">新密码:</label>';
                    show_html+='<input type="password" name="new_pwd">';
                show_html+='</div>';
                show_html+='<div>';
                    show_html+='<label for="re_new_pwd">重复新密码:</label>';
                    show_html+='<input type="password" name="re_new_pwd">';
                show_html+='</div>';
                show_html+='<div>';
                    show_html+='<input type="submit" value="修改">';
                show_html+='</div>';
            show_html+='</form>';
        show_html+='</div>';
        $('#detail-show').html(show_html)
    })
    // 绑定手机标签单击事件
    $('.bindPhone').on('click',function(){
        $('.selected').removeClass('selected')
        $('.bindPhoneLi').addClass('selected')
        $('#selected-title').html('绑定手机')
        show_html='<div id="bind-phone-box">'
            show_html+='<h2>绑定手机</h2>';
            show_html+='<form action="/user/username/bind_phone">';
                show_html+='<div>';
                    show_html+='<label for="phone-number">手机号:</label>';
                    show_html+='<input type="text" name="phone-number" placeholder="请输入手机号">';
                show_html+='</div>';
                show_html+='<div>';
                    show_html+='<label for="verify">验证码:</label>';
                    show_html+='<input type="text" name="verify" class="verify">';
                    show_html+='<button>获取验证码</button>';
                show_html+='</div>';
                show_html+='<div>';
                    show_html+='<input type="submit" value="绑定">';
                show_html+='</div>';
            show_html+='</form>';
        show_html+='</div>';
        $('#detail-show').html(show_html)
    })
    // 绑定邮箱标签单击事件
    $('.bindEmail').on('click',function(){
        $('.selected').removeClass('selected')
        $('.bindEmailLi').addClass('selected')
        $('#selected-title').html('绑定邮箱')
        show_html='<div id="bind-phone-box">'
            show_html+='<h2>绑定邮箱</h2>';
            show_html+='<form action="/user/username/bind_email">';
                show_html+='<div>';
                    show_html+='<label for="email">邮箱:</label>';
                    show_html+='<input type="text" name="email" placeholder="请输入邮箱">';
                show_html+='</div>';
                show_html+='<div>';
                    show_html+='<label for="verify">验证码:</label>';
                    show_html+='<input type="text" name="verify" class="verify">';
                    show_html+='<button>获取验证码</button>';
                show_html+='</div>';
                show_html+='<div>';
                    show_html+='<input type="submit" value="绑定">';
                show_html+='</div>';
            show_html+='</form>';
        show_html+='</div>';
        $('#detail-show').html(show_html)
    })

    $('.userCenter').on('click',function(){    
        login_static = is_login();
        if(login_static){
            window.location='/user/'+username;
        }
    })
    $('.add-album').on('click',function(){
        login_static = is_login();
        if(login_static){
            window.location='/user/add_album'
        }
    })


})
// 检查是否登录
function is_login(){
    var login_static=false;
    $.ajax({
        type:'get',
        url:'/user/islogin',
        async:false,
        beforeSend:function(request){
            var token = window.localStorage.getItem('syq_token')
            request.setRequestHeader('Authorization',token);
        },
        success:function(result){
            if (result.code==200){
               login_static=true;
            }else{
                alert(result.error)
            }
        }
    })
    return login_static;
}