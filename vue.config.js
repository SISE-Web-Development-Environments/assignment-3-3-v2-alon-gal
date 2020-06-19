module.exports = {
  configureWebpack: {
    devtool: "source-map"
  },
  devServer: {
    host: "localhost",
    port: 9999
  }
  // publicPath: process.env.NODE_ENV === "production" ? "/LAB12/" : "/"
};
