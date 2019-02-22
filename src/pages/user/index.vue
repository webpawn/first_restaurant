<template>
    <div></div>
</template>

<script>
export default {
    computed:{
        user(){
            console.log(this.$store.getters.user)
            return this.$store.getters.user
        }
    }
}
</script>

<style lang="stylus" scoped>

</style>
