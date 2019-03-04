module.exports = {
  plugins: {
    autoprefixer: {},
    /*'postcss-pxtorem': {
      rootValue: 37.5, //换算基数，一般和html的font-size一致
      propList: ['*']  //哪些css属性需要换算
    }*/
    "postcss-px-to-viewport": {
      //1vw = 3.2
      viewportWidth: 320,
      //1vh = 5.68
      viewportHeight: 568,
      // px to vw无法整除时，保留几位小数
      unitPrecision: 5,
      // 转换成vw单位
      viewportUnit: 'vw',
      //不转换的类名
      selectorBlackList: [],
      // 小于1px不转换
      minPixelValue: 1,
      //允许媒体查询中转换
      mediaQuery: false,
      //排除node_modules文件中第三方css文件
      exclude: /(\/|\\)(node_modules)(\/|\\)/
    },
  }
};
