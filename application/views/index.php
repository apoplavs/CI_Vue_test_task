<ul class="nav justify-content-center bg-dark text-light">
  <li class="nav-item">
    Test task
        <img src="<?php echo base_url();?>assets/img/civue.png" width="60" height="70">
        CI & Vue
  </li>
</ul>
  <div id="app">
   <div class="container">
    <div class="row">

        <transition
                enter-active-class="animated fadeInLeft"
                     leave-active-class="animated fadeOutRight">
                     <div class="notification is-success text-center px-5 top-middle" v-if="successMSG" @click="successMSG = false">{{successMSG}}</div>
        </transition>

        <div class="col-md-12">
            <table class="table is-bordered is-hoverable">
               <thead class="text-white bg-dark" >
                
                <th class="text-white">картинка</th>
                <th class="text-white">заголовок</th>
                <th class="text-white">дата публикации</th>
                <th class="text-white">текст</th>
                <th class="text-white">коментарии</th>
                </thead>
                <tbody class="table-light">
                    <tr v-for="n in news" class="table-default">
                        <td><img :src="n.img"  width='50' height="50"></td>
                        <td>{{n.header}}</td>
                        <td>{{n.time_created}}</td>
                        <td>
                          <span v-html="n.text.slice(0, 300)"></span>
                          <br>
                          <div class="like"><i class="fa fa-thumbs-up" @click="likeNews(n.news_id) ? n.likes++ : n.likes--;"></i> {{n.likes}}</div>
                        </td>
                        <td>
                          <div v-for="comment in n.comments" class="my-3 comment">
                            <sup class="delete-comment" @click="deleteComment(n, comment.comments_id)">x</sup>
                            <div>{{comment.comment}}</div>
                            <div class="like"><i class="fa fa-thumbs-up" @click="likeComment(comment.comments_id) ? comment.likes++ : comment.likes--;"></i> {{comment.likes}}</div>
                            <hr>
                          </div>
                          <div><i class="fa fa-edit" @click="addModal=true; newsToAddComment=n.news_id" title="Новый коментарий"></i></div>
                        </td>
                    </tr>
                    <tr v-if="emptyResult">
                      <td colspan="9" rowspan="4" class="text-center h1">Новостей не найдено</td>
                  </tr>
                </tbody>
                
            </table>
            
        </div>
  
    </div>
</div>
<?php include 'modal.php';?>

</div>

