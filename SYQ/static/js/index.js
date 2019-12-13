var username = window.localStorage.getItem('syq_user');
        var token = window.localStorage.getItem('syq_token');
        $(function(){
            // var token = window.localStorage.getItem('syq_token');
            // var username = window.localStorage.getItem('syq_user');
            if (token && username){
                html='';
                html+='<a class="userCenter" href="#">' +'用户:'+ username + ' |</a>'
                html+='<a href="/index" onclick="logout()"> 退出登录</a>'
                $('.top-right').html(html)
            }else{
                html='';
                html+='<a href="/user/login">登录 |</a>'
                html+='<a href="/user/register"> 注册</a>'
                $('.top-right').html(html)
            }

            $.ajax({
                type:'get',
                url:'/index/hotalbums',
                data:{'username':username},
                beforeSend:function(request){
                    var token = window.localStorage.getItem('syq_token')
                    request.setRequestHeader('Authorization',token);
                },
                success:function(result){
                    if (200==result.code){
                       albums_html = '';
                       $.each(result.data,function(i,obj){
                            albums_html+='<li>';
                                albums_html+='<div class="album-img">';
                                    albums_html+='<a class="img" href="/albums/album'+ obj.id +'" style="background-image:url('+obj.cover+'" ></a>';
                                albums_html+='</div>';
                                albums_html+='<div class="album-title">';
                                    albums_html+='<a class="title" href="/albums/album'+ obj.id +'">'+ obj.title +'</a>';
                                albums_html+='</div>';
                                albums_html+='<div class="album-info">';
                                    albums_html+='<a class="album-like" value="' + obj.id + '"></a><span>'+ obj.likes +'</span>';
                                    if(obj.is_collected){
                                        albums_html+='<a class="album-collect collected" value="' + obj.id + '"></a><span>'+ obj.collects +'</span>';
                                    }else{
                                        albums_html+='<a class="album-collect" value="' + obj.id + '"></a><span>'+ obj.collects +'</span>';
                                    }
                                albums_html+='</div>';
                                albums_html+='<div class="album-owner">';
                                    if(obj.owner.nickname){
                                        albums_html+='<a href="/albums/?ownername='+ obj.owner.ownername +'" class="owner">'+ obj.owner.nickname +'</a>';
                                    }else{
                                        albums_html+='<a href="/albums/?ownername='+ obj.owner.ownername +'" class="owner">'+ obj.owner.ownername +'</a>';
                                    }
                                    albums_html+='<span class="datetime">'+ obj.created_time +'</span>'
                                albums_html+='</div>';
                            albums_html+='</li>';

                       })
                       $('#albums').html(albums_html);

                       // 点赞
                       $('.album-like').on('click',function(){ 
                            $id = $(this)
                            var id = $id.attr('value');
                            data_dic = {'id':id};
                            if ($(this).attr('class')=='album-like'){
                                $.ajax({
                                    type:'post',
                                    dataType:'json',
                                    url:'/albums/album/likes',
                                    data:JSON.stringify(data_dic),
                                    beforeSend:function(request){
                                        var token = window.localStorage.getItem('syq_token')
                                        request.setRequestHeader('Authorization',token);
                                    },
                                    success:function(result){
                                        if(result.code==200){
                                            $id.toggleClass('like')
                                            num = $id.next().text()
                                            num = parseInt(num)
                                            $id.next().html(num+1)
                                        }else{
                                            alert(result.error)
                                        }
                                    }
                                })
                            }else{
                                $.ajax({
                                    type:'put',
                                    dataType:'json',
                                    url:'/albums/album/likes',
                                    data:JSON.stringify(data_dic),
                                    beforeSend:function(request){
                                        var token = window.localStorage.getItem('syq_token')
                                        request.setRequestHeader('Authorization',token);
                                    },
                                    success:function(result){
                                        if(result.code==200){
                                            $id.toggleClass('like')
                                            num = $id.next().text()
                                            num = parseInt(num)
                                            $id.next().html(num-1)
                                        }else{
                                            alert(result.error)
                                        }
                                    }
                                })
                            }
                            
                            
                        })
                       // 收藏
                       $('.album-collect').on('click',function(){ 
                            $id = $(this)
                            var id = $id.attr('value');
                            data_dic = {'id':id,'username':username};
                            if ($(this).attr('class')=='album-collect'){
                                $.ajax({
                                    type:'post',
                                    dataType:'json',
                                    url:'/albums/album/collect',
                                    data:JSON.stringify(data_dic),
                                    beforeSend:function(request){
                                        var token = window.localStorage.getItem('syq_token')
                                        request.setRequestHeader('Authorization',token);
                                    },
                                    success:function(result){
                                        if(result.code==200){
                                            $id.toggleClass('collected')
                                            num = $id.next().text()
                                            num = parseInt(num)
                                            $id.next().html(num+1)
                                        }else{
                                            alert(result.error)
                                        }
                                    }
                                })
                            }else{
                                $.ajax({
                                    type:'delete',
                                    dataType:'json',
                                    url:'/albums/album/collect',
                                    data:JSON.stringify(data_dic),
                                    beforeSend:function(request){
                                        var token = window.localStorage.getItem('syq_token')
                                        request.setRequestHeader('Authorization',token);
                                    },
                                    success:function(result){
                                        if(result.code==200){
                                            $id.toggleClass('collected')
                                            num = $id.next().text()
                                            num = parseInt(num)
                                            $id.next().html(num-1)
                                        }else{
                                            alert(result.error)
                                        }
                                    }
                                })
                            }  
                        })
                    }else{
                        alert(result.error)
                    }
                }
            })


            $('#search-btn').on('click',function(){
                keyword = $('#search-content').val()
                $.ajax({
                    type:'get',
                    url:'/index/search',
                    data:{'keyword':keyword,'username':username},
                    beforeSend:function(request){
                        var token = window.localStorage.getItem('syq_token');
                        request.setRequestHeader('Authorization',token);
                    },
                    success:function(result){
                        if (result.code==200){
                            title_html='<p>-' + keyword + '搜索-</p>';
                            $('.show-title').html(title_html);
                            albums_html = '';
                       $.each(result.data,function(i,obj){
                            albums_html+='<li>';
                                albums_html+='<div class="album-img">';
                                    albums_html+='<a class="img" href="/albums/album'+ obj.id +'" style="background-image:url('+obj.cover+'" ></a>';
                                albums_html+='</div>';
                                albums_html+='<div class="album-title">';
                                    albums_html+='<a class="title" href="/albums/album'+ obj.id +'">'+ obj.title +'</a>';
                                albums_html+='</div>';
                                albums_html+='<div class="album-info">';
                                    albums_html+='<a class="album-like" value="' + obj.id + '"></a><span>'+ obj.likes +'</span>';
                                    if(obj.is_collected){
                                        albums_html+='<a class="album-collect collected" value="' + obj.id + '"></a><span>'+ obj.collects +'</span>';
                                    }else{
                                        albums_html+='<a class="album-collect" value="' + obj.id + '"></a><span>'+ obj.collects +'</span>';
                                    }
                                albums_html+='</div>';
                                albums_html+='<div class="album-owner">';
                                    if(obj.owner.nickname){
                                        albums_html+='<a href="/albums/?ownername='+ obj.owner.ownername +'" class="owner">'+ obj.owner.nickname +'</a>';
                                    }else{
                                        albums_html+='<a href="/albums/?ownername='+ obj.owner.ownername +'" class="owner">'+ obj.owner.ownername +'</a>';
                                    }
                                    albums_html+='<span class="datetime">'+ obj.created_time +'</span>'
                                albums_html+='</div>';
                            albums_html+='</li>';

                       })
                       $('#albums').html(albums_html);
                       // 点赞
                        $('.album-like').on('click',function(){ 
                            $id = $(this)
                            var id = $id.attr('value');
                            data_dic = {'id':id};
                            if ($(this).attr('class')=='album-like'){
                                $.ajax({
                                    type:'post',
                                    dataType:'json',
                                    url:'/albums/album/likes',
                                    data:JSON.stringify(data_dic),
                                    beforeSend:function(request){
                                        var token = window.localStorage.getItem('syq_token')
                                        request.setRequestHeader('Authorization',token);
                                    },
                                    success:function(result){
                                        if(result.code==200){
                                            $id.toggleClass('like')
                                            num = $id.next().text()
                                            num = parseInt(num)
                                            $id.next().html(num+1)
                                        }else{
                                            alert(result.error)
                                        }
                                    }
                                })
                            }else{
                                $.ajax({
                                    type:'put',
                                    dataType:'json',
                                    url:'/albums/album/likes',
                                    data:JSON.stringify(data_dic),
                                    beforeSend:function(request){
                                        var token = window.localStorage.getItem('syq_token')
                                        request.setRequestHeader('Authorization',token);
                                    },
                                    success:function(result){
                                        if(result.code==200){
                                            $id.toggleClass('like')
                                            num = $id.next().text()
                                            num = parseInt(num)
                                            $id.next().html(num-1)
                                        }else{
                                            alert(result.error)
                                        }
                                    }
                                })
                            }
                            
                            
                        })
                        // 收藏
                        $('.album-collect').on('click',function(){ 
                            $id = $(this)
                            var id = $id.attr('value');
                            data_dic = {'id':id,'username':username};
                            if ($(this).attr('class')=='album-collect'){
                                $.ajax({
                                    type:'post',
                                    dataType:'json',
                                    url:'/albums/album/collect',
                                    data:JSON.stringify(data_dic),
                                    beforeSend:function(request){
                                        var token = window.localStorage.getItem('syq_token')
                                        request.setRequestHeader('Authorization',token);
                                    },
                                    success:function(result){
                                        if(result.code==200){
                                            $id.toggleClass('collected')
                                            num = $id.next().text()
                                            num = parseInt(num)
                                            $id.next().html(num+1)
                                        }else{
                                            alert(result.error)
                                        }
                                    }
                                })
                            }else{
                                $.ajax({
                                    type:'delete',
                                    dataType:'json',
                                    url:'/albums/album/collect',
                                    data:JSON.stringify(data_dic),
                                    beforeSend:function(request){
                                        var token = window.localStorage.getItem('syq_token')
                                        request.setRequestHeader('Authorization',token);
                                    },
                                    success:function(result){
                                        if(result.code==200){
                                            $id.toggleClass('collected')
                                            num = $id.next().text()
                                            num = parseInt(num)
                                            $id.next().html(num-1)
                                        }else{
                                            alert(result.error)
                                        }
                                    }
                                })
                            }  
                        })
                        }else if(result.code == 50104){
                            title_html='<p>-' + keyword + '搜索-</p>';
                            $('.show-title').html(title_html);
                            albums_html = result.error;
                            $('#albums').html(albums_html);
                        }else{
                            alert(result.error)
                        }
                    }
                })
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

        function logout(){
            window.localStorage.removeItem('syq_token');
            window.localStorage.removeItem('syq_user');
        }