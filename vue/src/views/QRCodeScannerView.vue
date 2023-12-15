<template>
  <div>
    <div class="qrcode-container">
      <StreamBarcodeReader @decode="onDecode" @loaded="onLoaded"></StreamBarcodeReader>
    </div>
  </div>
</template>
<script>
import { StreamBarcodeReader } from "vue-barcode-reader";
import AaronTest from "../components/AaronTest.vue";
export default {
  components: {
    StreamBarcodeReader,
  },
  data() {
    return {
      decodedResult: null,
    };
  },
  methods: {
    onDecode(result) {
      console.log(result);
      this.decodedResult = result;
      // Check if the decoded result is a valid URL
      if (this.isUrl(this.decodedResult)) {
        // Redirect to the website
        window.location.href = this.decodedResult;
      } else {
        // If not a URL, navigate to a different route using Vue Router
        this.$router.push({ name: "scan", query: { result } });
      }
    },
    onLoaded() {
      console.log(`Ready to start scanning barcodes`);
    },
    isUrl(value) {
      // Simple URL validation, you can enhance it based on your requirements
      const urlPattern = /^(http|https):\/\/.*$/;
      return urlPattern.test(value);
    },
  },
};
</script>
<style>
.qrcode-container {
  margin-top: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>