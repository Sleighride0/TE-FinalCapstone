<template>

<!--ADD THE FOLLOWING TO THE TEMPLATE TAG WHERE COMPONENT IS IMPORTED 
   
   <LiteYouTubeEmbed videoId="_PALjGstyFM"/>
   
</template> -->

    <div>
      <LiteYouTubeEmbed :id="videoId"      />
    </div>
  </template>
  
  <script>
  import LiteYouTubeEmbed from 'vue-lite-youtube-embed';
  import 'vue-lite-youtube-embed/style.css';
  
  export default {
  props: {
    videoId: {
      type: String,
      required: true,
    },
  },
  components: {
    LiteYouTubeEmbed,
  },
};
</script>
  
  <style scoped>
  </style>