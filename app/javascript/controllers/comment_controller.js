import axios from 'axios';
import Vue from 'vue/dist/vue.esm';


document.addEventListener('turbolinks:load', function(event) {
  let el = document.querySelector('.comlike');
	if (el) {
  new Vue({
    el,
    data() {
			return{
        recomlike : false 
			}
    },
    
    methods: {
      addComLike(event) {
        event.preventDefault();
        let slug = event.currentTarget.dataset.slug
        let postid = event.currentTarget.dataset.post
        let icon = document.querySelector('i.like'+slug);
        let recomlikes = document.querySelector('span.like'+slug);
        let p = parseInt(recomlikes.innerHTML)
        // console.log(icon)
        //  /posts/:post_id/comments/:id/comlike
        axios.post(`/api
        
        
        /posts/${postid}/comments/${slug}/comlike`)
          .then((response) => {
          let status = response.data.status
          // console.log(status)
          switch (status) {
            case 'sign_in_first':
              alert('你必須先登入')
              break
              case 'comlike':
                icon.classList.add('far')
                icon.classList.remove('fas')
                recomlikes.innerHTML = p-1
              break
              case 'recomlike':
                icon.classList.add('fas')
                icon.classList.remove('far')
                recomlikes.innerHTML = p+1
              break
              }
          })
          .catch((error) =>{
          console.log(error)
          })
      }
    }
  })
	}
})
