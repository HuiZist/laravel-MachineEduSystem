<template>
    <button class="btn btn-default"
            v-bind:class="{'btn-primary':voted}"
            v-on:click="vote"
    ><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>&ensp;{{ Mycount }}
    </button>
</template>

<script>
    export default {
        props:['answer','count'],
        mounted() {
            axios.post('/api/answer/'+this.answer+'/votes/users').then(response => {
                this.voted = response.data.voted;
            })
        },
        data(){
            return {
                voted: false,
                Mycount:this.count,
            }
        },
        methods:{
            vote(){
                axios.post('/api/answer/vote',{'answer':this.answer}).then(response => {
                    this.voted = response.data.voted;
                    response.data.voted ? this.Mycount++ : this.Mycount--;
                })
            }
        }
    }
</script>
