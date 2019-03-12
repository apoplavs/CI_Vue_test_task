
Vue.component('modal',{ //modal
    template:`
      <transition
                enter-active-class="animated rollIn"
                     leave-active-class="animated rollOut">
    <div class="modal is-active" >
  <div class="modal-card border border border-secondary">
    <div class="modal-card-head text-center bg-dark">
    <div class="modal-card-title text-white">
          <slot name="head"></slot>
    </div>
<button class="delete" @click="$emit('close')"></button>
    </div>
    <div class="modal-card-body">
         <slot name="body"></slot>
    </div>
    <div class="modal-card-foot" >
      <slot name="foot"></slot>
    </div>
  </div>
</div>
</transition>
    `
})
var v = new Vue({
   el:'#app',
    data:{
        url:'http://site.devel/',
        addModal: false,
        newsToAddComment:0,
        news:[],
        search: {text: ''},
        emptyResult:false,
        newComment:{
            news:0,
            comment:''
          },
        successMSG:''
    },
     created(){
      this.showAll(); 
    },
    methods:{
         showAll(){ axios.get(this.url+"tests").then(function(response){
             if(response.data.data == null){
                 v.noResult();
                }else{
                  v.news = response.data.data;
                }
            })
        },


        likeComment(id){
          let comments_likes = [];

          if (sessionStorage.comments_likes) {
              comments_likes = JSON.parse(sessionStorage.getItem("comments_likes"));
          }

          if (comments_likes.indexOf(id) == -1) {
            comments_likes.push(id);

            axios.post(this.url+"comments/like/"+id).then(function(response){
              sessionStorage.setItem("comments_likes", JSON.stringify(comments_likes));
            });
            return true;

          } else {
            var new_comments_likes = comments_likes.splice(comments_likes.indexOf(id), 1);
            axios.delete(this.url+"comments/unlike/"+id).then(function(response){

             sessionStorage.setItem("comments_likes", JSON.stringify(comments_likes));
            });
            return false;

          }
        },


        likeNews(id){
           let news_likes = [];

          if (sessionStorage.news_likes) {
              news_likes = JSON.parse(sessionStorage.getItem("news_likes"));
          }

          if (news_likes.indexOf(id) == -1) {
            news_likes.push(id);

            axios.post(this.url+"tests/like/"+id).then(function(response){
              sessionStorage.setItem("news_likes", JSON.stringify(news_likes));
            });
            return true;

          } else {
            var new_news_likes = news_likes.splice(news_likes.indexOf(id), 1);
            axios.delete(this.url+"tests/unlike/"+id).then(function(response){

             sessionStorage.setItem("news_likes", JSON.stringify(news_likes));
            });
            return false;

          }
         }, 

        addComment(){
            v.newComment.news = v.newsToAddComment;
            var formData = v.formData(v.newComment);

              axios.post(this.url+"comments/store", formData).then(function(response){
                if(response.data.error){
                    v.successMSG = response.data.msg;
                }else{
                    v.successMSG = response.data.msg;
                    v.showAll();
                    v.addModal= false;
                    v.clearMSG();
                }
               });
        },
        deleteComment(news, id){
            axios.delete(this.url+"comments/delete/"+id).then(function(response){
              var news_index = v.news.indexOf(news);
              v.news[news_index].comments.splice(v.news[news_index].comments.indexOf(id), 1);
              v.showAll();
            });
        },

        formData(obj){
			     var formData = new FormData();
		      for ( var key in obj ) {
		          formData.append(key, obj[key]);
		      } 
		      return formData;
		    },

        clearMSG(){
           setTimeout(function(){
  			     v.successMSG='';
  			   },3000);
        },
        closeModal() {
          v.addModal= false;
          v.newsToAddComment = 0;
        }
    }
})