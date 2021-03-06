import axios from 'axios';
import Rails from '@rails/ujs';
import Vue from 'vue/dist/vue.esm';
// import App from '../app.vue'


document.addEventListener('turbolinks:load', function(event) {
  // let slug = event.currentTarget.dataset.slug;
	// console.log(event);
  let el = document.querySelector('#like');
	if (el) {
  new Vue({
    el,
    data() {
			return{
				iconlike: 'far fa-heart',
				iconrelike: 'fas fa-heart',
				// relike: 0
			}
    },
    
    methods: {
      addLike(event) {
        event.preventDefault();
        let slug = event.currentTarget.dataset.slug
        let icon = 'fas fa-heart'
		let relikes = document.querySelector('span.relikes');
		let p = parseInt(relikes.innerHTML)
		// relikes = 100
        axios.post(`/api/posts/${slug}/like`)
          .then((response) => {
          // console.log(relikes.innerHTML)
		  let status = response.data.status
		  switch (status) {
			case 'sign_in_first':
				alert('你必須先登入')
				break
			case 'like':
				icon = 'far fa-heart'
				this.iconrelike = icon
				this.iconlike = icon
				relikes.innerHTML = p-1
				break
			case 'relike':
				icon = 'fas fa-heart'
				this.iconlike = icon
				this.iconrelike = icon
				relikes.innerHTML = p+1
				break
			}
		})
			.catch(function(error){
			console.log(error)
		})	
      }
    },
  })
	}
})
