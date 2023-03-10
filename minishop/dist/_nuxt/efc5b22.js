/*! For license information please see LICENSES */
(window.webpackJsonp=window.webpackJsonp||[]).push([[61],{381:function(e,t,r){"use strict";r(17),r(11),r(12),r(7),r(16),r(25),r(26);var o=r(2),c=r(5);function n(object,e){var t=Object.keys(object);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(object);e&&(r=r.filter((function(e){return Object.getOwnPropertyDescriptor(object,e).enumerable}))),t.push.apply(t,r)}return t}function l(e){for(var i=1;i<arguments.length;i++){var source=null!=arguments[i]?arguments[i]:{};i%2?n(Object(source),!0).forEach((function(t){Object(o.a)(e,t,source[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(source)):n(Object(source)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(source,t))}))}return e}var d={props:{title:{type:String,required:!0},subtitle:String},computed:l(l({},Object(c.c)("company",["getCompany"])),{},{pageTitle:function(){return this.$route.path.includes("wishlist")?"Yêu thích":this.$route.path.includes("account")?"Tài khoản":this.$route.path.includes("cart")?"Giỏ hàng":this.$route.path.includes("checkout")?"Đặt hàng":this.$route.path.includes("blog")?"Bài viết":this.$route.path.includes("about")?"Tài khoản":this.title}})},m=r(6),component=Object(m.a)(d,(function(){var e=this.$createElement,t=this._self._c||e;return t("div",{directives:[{name:"lazy",rawName:"v-lazy:background-image",value:"./images/page-header-bg.jpg",expression:"'./images/page-header-bg.jpg'",arg:"background-image"}],staticClass:"page-header text-center"},[t("div",{staticClass:"container"},[t("h1",{staticClass:"page-title"},[this._v("\n            "+this._s(this.pageTitle)+"\n            "),t("span",[this._v(this._s(this.getCompany.companyName))])])])])}),[],!1,null,null,null);t.a=component.exports},384:function(e,t,r){"use strict";r.d(t,"a",(function(){return n}));var o={name:"VueSlideToggle",props:{open:Boolean,duration:{type:Number,default:300},tag:{type:String,default:"div"}},data:function(){return{scrollHeight:0,doneOpenTransition:!1,innerOpen:this.open}},mounted:function(){window.addEventListener("resize",this.getHeight),this.getHeight()},updated:function(){this.getHeight()},destroyed:function(){window.removeEventListener("resize",this.getHeight)},watch:{open:function(e){var t=this;e?this.innerOpen=!0:(this.getHeight(),this.doneOpenTransition=!1,this.$nextTick().then((function(){t.innerOpen=!1})))}},computed:{style:function(){if(this.innerOpen&&this.doneOpenTransition)return null;var e=this.innerOpen?this.scrollHeight:0;return{overflow:"hidden",transitionProperty:"height",height:"".concat(e,"px"),transitionDuration:"".concat(this.duration,"ms")}}},methods:{getHeight:function(){var e=this.$refs.container;this.scrollHeight=e.scrollHeight},handleTransition:function(){this.innerOpen&&(this.doneOpenTransition=!0)}},render:function(e){return e(this.tag,{style:this.style,ref:"container",on:{transitionend:this.handleTransition}},this.$slots.default)}};var c={install:function e(t){e.installed||(e.installed=!0,t.component("VueSlideToggle",o))}},n=o,l=null;"undefined"!=typeof window&&(l=window.Vue),l&&l.use(c)},395:function(e,t,r){"use strict";r.d(t,"b",(function(){return o})),r.d(t,"c",(function(){return c})),r.d(t,"d",(function(){return n})),r.d(t,"e",(function(){return l})),r.d(t,"f",(function(){return d})),r.d(t,"g",(function(){return m})),r.d(t,"a",(function(){return h}));var o=[{id:1,class:"accessories women",image:"./images/portfolio/item-1.jpg",category:"Accessories"},{id:2,class:"men",image:"./images/portfolio/item-2.jpg",category:"Men"},{id:3,class:"women accessories",image:"./images/portfolio/item-3.jpg",category:"Women"},{id:4,class:"men",image:"./images/portfolio/item-4.jpg",category:"Accessories"},{id:5,class:"men women",image:"./images/portfolio/item-5.jpg",category:"Women"},{id:6,class:"men accessories",image:"./images/portfolio/item-6.jpg",category:"Men"}],c=[{class:"accessories women",image:"./images/portfolio/4cols/item-1.jpg",title:"Vestibulum auctor dapibus",category:"Accessories"},{class:"men",image:"./images/portfolio/4cols/item-2.jpg",title:"Vestibulum auctor dapibus",category:"Men"},{class:"women accessories",image:"./images/portfolio/4cols/item-3.jpg",title:"Vestibulum auctor dapibus",category:"Women"},{class:"men",image:"./images/portfolio/4cols/item-4.jpg",title:"Vestibulum auctor dapibus",category:"Accessories"},{class:"men women",image:"./images/portfolio/4cols/item-5.jpg",title:"Vestibulum auctor dapibus",category:"Women"},{class:"men accessories",image:"./images/portfolio/4cols/item-6.jpg",title:"Vestibulum auctor dapibus",category:"Men"},{class:"men",image:"./images/portfolio/4cols/item-7.jpg",title:"Vestibulum auctor dapibus",category:"Men"},{class:"women accessories",image:"./images/portfolio/4cols/item-8.jpg",title:"Vestibulum auctor dapibus",category:"Women"}],n=[{class:"accessories women",image:"./images/portfolio/masonry-3cols/item-1.jpg",title:"Vestibulum auctor dapibus",category:"Accessories"},{class:"men",image:"./images/portfolio/masonry-3cols/item-2.jpg",title:"Vestibulum auctor dapibus",category:"Men"},{class:"women accessories",image:"./images/portfolio/masonry-3cols/item-3.jpg",title:"Vestibulum auctor dapibus",category:"Women"},{class:"men",image:"./images/portfolio/masonry-3cols/item-4.jpg",title:"Vestibulum auctor dapibus",category:"Accessories"},{class:"men women",image:"./images/portfolio/masonry-3cols/item-5.jpg",title:"Vestibulum auctor dapibus",category:"Women"},{class:"men accessories",image:"./images/portfolio/masonry-3cols/item-6.jpg",title:"Vestibulum auctor dapibus",category:"Men"}],l=[{class:"accessories women",image:"./images/portfolio/masonry-4cols/item-1.jpg",title:"Vestibulum auctor dapibus",category:"Accessories"},{class:"men",image:"./images/portfolio/masonry-4cols/item-2.jpg",title:"Vestibulum auctor dapibus",category:"Men"},{class:"women accessories",image:"./images/portfolio/masonry-4cols/item-3.jpg",title:"Vestibulum auctor dapibus",category:"Women"},{class:"men",image:"./images/portfolio/masonry-4cols/item-4.jpg",title:"Vestibulum auctor dapibus",category:"Accessories"},{class:"men women",image:"./images/portfolio/masonry-4cols/item-5.jpg",title:"Vestibulum auctor dapibus",category:"Women"},{class:"men accessories",image:"./images/portfolio/masonry-4cols/item-6.jpg",title:"Vestibulum auctor dapibus",category:"Men"},{class:"men",image:"./images/portfolio/masonry-4cols/item-7.jpg",title:"Vestibulum auctor dapibus",category:"Men"},{class:"women accessories",image:"./images/portfolio/masonry-4cols/item-8.jpg",title:"Vestibulum auctor dapibus",category:"Women"}],d=[{class:"accessories women",image:"./images/portfolio/fullwidth/item-1.jpg",title:"Vestibulum auctor dapibus",category:"Accessories"},{class:"accessories",image:"./images/portfolio/fullwidth/item-2.jpg",title:"Nunc dignissim risus",category:"Accessories"},{class:"men accessories",image:"./images/portfolio/fullwidth/item-3.jpg",title:"Cras ornare tristique",category:"Men"},{class:"men",image:"./images/portfolio/fullwidth/item-4.jpg",title:"Vivamus vestibulum ntulla",category:"Men"},{class:"men women",image:"./images/portfolio/fullwidth/item-5.jpg",title:"Vestibulum auctor dapibus",category:"Women"},{class:"men accessories",image:"./images/portfolio/fullwidth/item-6.jpg",title:"Nunc dignissim risus",category:"Accessories"},{class:"women accessories",image:"./images/portfolio/fullwidth/item-7.jpg",title:"Cras ornare tristique",category:"Women"},{class:"men accessories",image:"./images/portfolio/fullwidth/item-8.jpg",title:"Vivamus vestibulum ntulla",category:"Accessories"}],m={sizes:[{size:"Extra Small",slug:"XS"},{size:"Small",slug:"S"},{size:"Medium",slug:"M"},{size:"Large",slug:"L"},{size:"Extra Large",slug:"XL"}],colors:[{color:"#cc9966",color_name:"Brown"},{color:"#3399cc",color_name:"Blue"},{color:"#9966cc",color_name:"Purple"},{color:"#333333",color_name:"Black"},{color:"#669933",color_name:"Green"},{color:"#cc3333",color_name:"Red"},{color:"#999999",color_name:"Grey"}],brands:[{brand:"Next",slug:"next"},{brand:"River Island",slug:"river-island"},{brand:"Geox",slug:"geox"},{brand:"New Balance",slug:"nex-balance"},{brand:"UGG",slug:"ugg"},{brand:"F&F",slug:"f-and-f"},{brand:"Nike",slug:"nike"}],categories:[{name:"Furniture",slug:"furniture",count:8},{name:"Coffee & Tables",slug:"coffee-and-tables",count:1},{name:"Lighting",slug:"lighting",count:3},{name:"Decoration",slug:"decoration",count:5},{name:"Electronics",slug:"electronics",count:1},{name:"Beds",slug:"beds",count:2},{name:"Armchairs & Chaises",slug:"armchairs-and-chaises",count:3},{name:"Sofas & Sleeper Sofas",slug:"sofas-and-sleeper-sofas",count:1}],prices:[{min:"0",max:"25",name:"Under $25"},{min:"25",max:"50",name:"$25 to $50"},{min:"50",max:"100",name:"$50 to $100"},{min:"100",max:"200",name:"$100 to $200"},{min:"200",max:null,name:"$200 & Above"}]},h={brands:[{name:"brand",image:"./images/brands/1.png",width:100,height:23},{name:"brand",image:"./images/brands/2.png",width:101,height:34},{name:"brand",image:"./images/brands/3.png",width:100,height:30},{name:"brand",image:"./images/brands/4.png",width:101,height:39},{name:"brand",image:"./images/brands/5.png",width:100,height:48},{name:"brand",image:"./images/brands/6.png",width:100,height:23},{name:"brand",image:"./images/brands/7.png",width:63,height:32},{name:"brand",image:"./images/brands/8.png",width:80,height:72},{name:"brand",image:"./images/brands/9.png",width:100,height:25}]}},406:function(e,t,r){var content=r(422);"string"==typeof content&&(content=[[e.i,content,""]]),content.locals&&(e.exports=content.locals);(0,r(32).default)("ccbf1dda",content,!0,{sourceMap:!1})},421:function(e,t,r){"use strict";r(406)},422:function(e,t,r){(t=r(31)(!1)).push([e.i,"#filter-price-range{display:none}",""]),e.exports=t},428:function(e,t,r){"use strict";r(17),r(11),r(12),r(7),r(16),r(284),r(18);var o=r(4),c=r(2),n=r(384),l=r(395),d=r(5);function m(object,e){var t=Object.keys(object);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(object);e&&(r=r.filter((function(e){return Object.getOwnPropertyDescriptor(object,e).enumerable}))),t.push.apply(t,r)}return t}function h(e){for(var i=1;i<arguments.length;i++){var source=null!=arguments[i]?arguments[i]:{};i%2?m(Object(source),!0).forEach((function(t){Object(c.a)(e,t,source[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(source)):m(Object(source)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(source,t))}))}return e}var f={components:{VueSlideToggle:n.a},props:{isSidebar:Boolean},data:function(){return{loaded:!0,priceValues:[0,15e7],priceSliderConfig:{connect:!0,step:1e5,margin:1e5,range:{min:0,max:15e7}},filterData:l.g,selectedCategories:[]}},computed:h(h({},Object(d.c)("category",["categories"])),{},{priceRangeText:function(){return"$"+parseInt(this.priceValues[0])+" — $"+parseInt(this.priceValues[1])},priceFilterRoute:function(){var e={};if(this.$route.query.page)for(var t in this.$route.query)"page"!==t&&(e[t]=this.$route.query[t]);else e=h({},this.$route.query);return{path:this.$route.path,query:h(h({},e),{},{minPrice:this.priceValues[0],maxPrice:this.priceValues[1]})}}}),created:function(){this.renderCategories(this.$companyName),document.querySelector("body").classList.remove("sidebar-filter-active"),this.$route.query.minPrice&&this.$route.query.maxPrice?(this.loaded=!1,this.priceValues=[this.$route.query.minPrice,this.$route.query.maxPrice],this.$nextTick((function(){this.loaded=!0}))):(this.loaded=!1,this.$nextTick((function(){this.loaded=!0})))},methods:h(h(h(h({},Object(d.b)("category",["renderCategories"])),Object(d.b)("product",["search"])),Object(d.d)("product",["SET_PRODUCT_CATEGORY","SET_PRODUCT_PRICE_RANGE","CLEAN_QUERY_OPTIONS"])),{},{onCategoryClick:function(e){var t=this;return Object(o.a)(regeneratorRuntime.mark((function r(){return regeneratorRuntime.wrap((function(r){for(;;)switch(r.prev=r.next){case 0:return t.SET_PRODUCT_CATEGORY(e.slug),r.next=3,t.search({company:t.$companyName,reload:!0});case 3:case"end":return r.stop()}}),r)})))()},applyPriceRange:function(){var e=this;return Object(o.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return e.SET_PRODUCT_PRICE_RANGE(e.priceValues),t.next=3,e.search({company:e.$companyName,reload:!0});case 3:case"end":return t.stop()}}),t)})))()},cleanAll:function(){var e=this;return Object(o.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return e.CLEAN_QUERY_OPTIONS(),e.priceValues=[0,2e8],e.selectedCategories=[],e.$forceUpdate(),t.next=6,e.search({company:e.$companyName,reload:!0});case 6:case"end":return t.stop()}}),t)})))()},categorySelected:function(e){},setSizeFilter:function(e){}})},v=(r(421),r(6)),component=Object(v.a)(f,(function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"sidebar-shop pr-4",class:e.isSidebar?"sidebar-filter":"sidebar"},[r("div",{class:{"sidebar-filter-wrapper":e.isSidebar}},[r("div",{staticClass:"widget widget-clean pl-1 pr-2"},[r("label",[e._v("Bộ lọc:")]),e._v(" "),r("a",{staticClass:"sidebar-filter-clear",attrs:{href:"#"},on:{click:function(t){return t.preventDefault(),e.cleanAll(t)}}},[e._v("Xóa tất cả")])]),e._v(" "),r("div",{staticClass:"widget pl-1 pr-2"},[e._m(0),e._v(" "),r("vue-slide-toggle",{staticClass:"show",attrs:{open:!0}},[r("div",{staticClass:"widget-body pt-0"},[r("div",{staticClass:"filter-price"},[r("vue-nouislider",{staticClass:"mb-2",attrs:{config:e.priceSliderConfig,values:e.priceValues}}),e._v(" "),r("p",[e._v("\n                            "+e._s(e.formatPrice(e.priceValues[0],!1))+"\n                            - "+e._s(e.formatPrice(e.priceValues[1],!1))+"\n                        ")]),e._v(" "),r("br"),e._v(" "),r("a",{staticClass:"sidebar-filter-clear",attrs:{href:"#"},on:{click:function(t){return t.preventDefault(),e.applyPriceRange(t)}}},[e._v("Áp dụng")])],1)])])],1),e._v(" "),r("div",{staticClass:"widget pl-1 pr-2"},[e._m(1),e._v(" "),r("vue-slide-toggle",{staticClass:"show pb-2",attrs:{open:!0}},[r("div",{staticClass:"widget-body pt-0"},[r("div",{staticClass:"filter-items"},[e.categories.length?e._l(e.categories,(function(t,o){return r("div",{key:o,staticClass:"filter-item"},[r("div",{staticClass:"custom-control custom-checkbox"},[r("input",{directives:[{name:"model",rawName:"v-model",value:e.selectedCategories,expression:"selectedCategories"}],staticClass:"custom-control-input",attrs:{type:"checkbox",id:"size-"+o},domProps:{value:t.slug,checked:Array.isArray(e.selectedCategories)?e._i(e.selectedCategories,t.slug)>-1:e.selectedCategories},on:{click:function(r){return e.onCategoryClick(t)},change:function(r){var o=e.selectedCategories,c=r.target,n=!!c.checked;if(Array.isArray(o)){var l=t.slug,d=e._i(o,l);c.checked?d<0&&(e.selectedCategories=o.concat([l])):d>-1&&(e.selectedCategories=o.slice(0,d).concat(o.slice(d+1)))}else e.selectedCategories=n}}}),e._v(" "),r("label",{staticClass:"custom-control-label",attrs:{for:"size-"+o}},[e._v(e._s(t.name)+" ("+e._s(t.count)+")")])])])})):r("p",[e._v("\n                            Chưa có phân loại được tạo.\n                        ")])],2)])])],1)])])}),[function(){var e=this.$createElement,t=this._self._c||e;return t("h3",{staticClass:"widget-title mb-2"},[t("a",{attrs:{href:"#widget-5"}},[this._v("Giá tiền")])])},function(){var e=this.$createElement,t=this._self._c||e;return t("h3",{staticClass:"widget-title mb-2"},[t("a",{attrs:{href:"#widget-2"}},[this._v("Phân loại")])])}],!1,null,null,null);t.a=component.exports},611:function(e,t,r){"use strict";r.r(t);r(17),r(11),r(12),r(7),r(16),r(18);var o=r(4),c=r(2),n=r(5),l=r(381),d=r(45);function m(object,e){var t=Object.keys(object);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(object);e&&(r=r.filter((function(e){return Object.getOwnPropertyDescriptor(object,e).enumerable}))),t.push.apply(t,r)}return t}function h(e){for(var i=1;i<arguments.length;i++){var source=null!=arguments[i]?arguments[i]:{};i%2?m(Object(source),!0).forEach((function(t){Object(c.a)(e,t,source[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(source)):m(Object(source)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(source,t))}))}return e}var f={props:{product:Object},data:function(){return{baseUrl:d.a,maxPrice:0,minPrice:99999}},computed:h(h({},Object(n.c)("cart",["canAddToCart"])),Object(n.c)("wishlist",["isInWishlist"])),created:function(){var e=this.minPrice,t=this.maxPrice;this.product.variants.map((function(r){e>r.price&&(e=r.price),t<r.price&&(t=r.price)}),[]),0==this.product.variants.length&&(e=this.product.sale_price?this.product.sale_price:this.product.price,t=this.product.price),this.minPrice=e,this.maxPrice=t},methods:h(h(h({},Object(n.b)("cart",["addToCart"])),Object(n.b)("wishlist",["addToWishlist"])),{},{quickView:function(){this.$modal.show((function(){return r.e(6).then(r.bind(null,604))}),{product:this.product},{width:"1030",height:"auto",adaptive:!0})}})},v=r(6),y={components:{ProductTen:Object(v.a)(f,(function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"product"},[r("figure",{staticClass:"product-media"},[e.product.new?r("span",{staticClass:"product-label label-new"},[e._v("New")]):e._e(),e._v(" "),e.product.sale_price?r("span",{staticClass:"product-label label-sale"},[e._v("Sale")]):e._e(),e._v(" "),e.product.top?r("span",{staticClass:"product-label label-top"},[e._v("Top")]):e._e(),e._v(" "),0===e.product.stock?r("span",{staticClass:"product-label label-out"},[e._v("Out Of Stock")]):e._e(),e._v(" "),e.product.pictures[0]?r("nuxt-link",{attrs:{to:"/product/default/"+e.product.slug}},[r("img",{directives:[{name:"lazy",rawName:"v-lazy",value:""+e.product.pictures[0].url,expression:"`${product.pictures[0].url}`"}],staticClass:"product-image",attrs:{alt:"Product",width:e.product.sm_pictures[0].width,height:e.product.sm_pictures[0].height}}),e._v(" "),e.product.sm_pictures[1]?r("img",{directives:[{name:"lazy",rawName:"v-lazy",value:""+e.product.pictures[1].url,expression:"`${product.pictures[1].url}`"}],staticClass:"product-image-hover",attrs:{alt:"Product",width:e.product.sm_pictures[1].width,height:e.product.sm_pictures[1].height}}):e._e()]):e._e(),e._v(" "),0!==e.product.stock?r("div",{staticClass:"product-action action-icon-top"},[e.product.variants.length>0?r("nuxt-link",{staticClass:"btn-product btn-cart btn-select",attrs:{to:"/product/default/"+e.product.slug}},[r("span",[e._v("select options")])]):r("button",{staticClass:"btn-product btn-cart",on:{click:function(t){return t.preventDefault(),e.addToCart({product:e.product})}}},[r("span",[e._v("thêm vào giỏ hàng")])]),e._v(" "),r("button",{staticClass:"btn-product btn-quickview",attrs:{title:"Quick view"},on:{click:function(t){return t.preventDefault(),e.quickView({product:e.product})}}},[r("span",[e._v("quick view")])])],1):e._e()],1),e._v(" "),r("div",{staticClass:"product-body product-action-inner"},[e.isInWishlist(e.product)?r("nuxt-link",{key:"inWishlist",staticClass:"btn-product btn-wishlist added-to-wishlist",attrs:{to:"/shop/wishlist"}},[r("span",[e._v("Xem trong yêu thích")])]):r("a",{key:"notInWishlist",staticClass:"btn-product btn-wishlist",attrs:{href:"javascript:;"},on:{click:function(t){return t.preventDefault(),e.addToWishlist({product:e.product})}}},[r("span",[e._v("Thêm vào yêu thích")])]),e._v(" "),r("div",{staticClass:"product-cat"},e._l(e.product.category,(function(t,o){return r("span",{key:o},[r("nuxt-link",{attrs:{to:{path:"/shop/sidebar/list",query:{category:t.slug}}}},[e._v(e._s(t.name))]),e._v("\n                "+e._s(o<e.product.category.length-1?",":"")+"\n            ")],1)})),0),e._v(" "),r("h3",{staticClass:"product-title"},[r("nuxt-link",{attrs:{to:"/product/default/"+e.product.slug}},[e._v(e._s(e.product.name))])],1),e._v(" "),0==e.product.stock?r("div",{key:"outPrice",staticClass:"product-price"},[r("span",{staticClass:"out-price"},[e._v(e._s(e.formatPrice(e.product.price)))])]):[e.minPrice==e.maxPrice?r("div",{staticClass:"product-price"},[e._v("\n                "+e._s(e.formatPrice(e.minPrice))+"\n            ")]):[0==e.product.variants.length?r("div",{staticClass:"product-price"},[r("span",{staticClass:"new-price"},[e._v(e._s(e.formatPrice(e.minPrice)))]),e._v(" "),r("span",{staticClass:"old-price"},[e._v(e._s(e.formatPrice(e.maxPrice)))])]):r("div",{staticClass:"product-price"},[e._v("\n                    "+e._s(e.formatPrice(e.minPrice))+"–"+e._s(e.formatPrice(e.maxPrice))+"\n                ")])]],e._v(" "),r("div",{staticClass:"ratings-container"},[r("div",{staticClass:"ratings"},[r("div",{staticClass:"ratings-val",style:{width:20*e.product.ratings+"%"}}),e._v(" "),r("span",{staticClass:"tooltip-text"},[e._v(e._s(e.product.ratings.toFixed(0)))])]),e._v(" "),r("span",{staticClass:"ratings-text"},[e._v("( "+e._s(e.product.review)+" Reviews )")])]),e._v(" "),e.product.variants.length>0?r("div",{staticClass:"product-nav product-nav-dots"},[r("div",{staticClass:"row no-gutters"},e._l(e.product.variants,(function(t,o){return r("a",{key:o,style:{"background-color":t.color},attrs:{href:"javascript:;"}},[r("span",{staticClass:"sr-only"},[e._v("Color name")])])})),0)]):e._e()],2)])}),[],!1,null,null,null).exports},props:{products:Array,loaded:Boolean},data:function(){return{fakeArray:[1,2,3,4,5,6,7,8]}},computed:{cols:function(){return"boxed"==this.$route.params.type?"col-6 col-md-4 col-lg-4 col-xl-3":"col-6 col-md-4 col-lg-4 col-xl-3 col-xxl-2"}}},_=Object(v.a)(y,(function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"products mb-3 content-overlay"},[0===e.products.length&&e.loaded?r("p",{staticClass:"no-results"},[e._v("No products matching your selection.")]):e._e(),e._v(" "),r("div",{staticClass:"row"},[e.loaded?e._l(e.products,(function(t,o){return r("div",{key:o,class:e.cols},[r("product-ten",{attrs:{product:t}})],1)})):e._l(e.fakeArray,(function(t){return r("div",{key:t,class:e.cols},[r("div",{staticClass:"skel-pro"})])}))],2)])}),[],!1,null,null,null).exports,w=r(428),C=r(78);function O(object,e){var t=Object.keys(object);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(object);e&&(r=r.filter((function(e){return Object.getOwnPropertyDescriptor(object,e).enumerable}))),t.push.apply(t,r)}return t}function j(e){for(var i=1;i<arguments.length;i++){var source=null!=arguments[i]?arguments[i]:{};i%2?O(Object(source),!0).forEach((function(t){Object(c.a)(e,t,source[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(source)):O(Object(source)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(source,t))}))}return e}var P,x={components:{PageHeader:l.a,ShopListThree:_,ShopSidebarOne:w.a},data:function(){return{products:[],perPage:8,type:"list",totalCount:0,orderBy:"default",isSidebar:!0,loaded:!1,loadMoreLoading:!1}},computed:j(j({},Object(n.c)("demo",["currentDemo"])),{},{pageTitle:function(){return"boxed"==this.$route.params.type?"Boxed No Sidebar":"Fullwidth No Sidebar"},containerClass:function(){return"fullwidth"==this.$route.params.type?"container-fluid":"container"},hasMore:function(){return this.perPage<=this.totalCount}}),watch:{$route:function(){this.getProducts(!0)}},created:function(){this.getProducts()},methods:{getProducts:(P=Object(o.a)(regeneratorRuntime.mark((function e(){var t,r=this,o=arguments;return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return t=o.length>0&&void 0!==o[0]&&o[0],o.length>1&&void 0!==o[1]&&o[1]||(this.loaded=!1),e.next=5,d.b.get("".concat(d.a,"/shop"),{params:j(j({},this.$route.query),{},{orderBy:this.orderBy,perPage:this.perPage,demo:this.currentDemo})}).then((function(e){r.products=e.data.products,r.totalCount=e.data.totalCount,r.loaded=!0,t&&Object(C.e)()})).catch((function(e){return{error:JSON.stringify(e)}}));case 5:case"end":return e.stop()}}),e,this)}))),function(){return P.apply(this,arguments)}),toggleSidebar:function(){document.querySelector("body").classList.contains("sidebar-filter-active")?document.querySelector("body").classList.remove("sidebar-filter-active"):document.querySelector("body").classList.add("sidebar-filter-active")},showSidebar:function(){document.querySelector("body").classList.add("sidebar-filter-active")},hideSidebar:function(){document.querySelector("body").classList.remove("sidebar-filter-active")},loadMore:function(){var e=this;this.perPage<this.totalCount&&(this.perPage+=4,this.loadMoreLoading=!0,setTimeout((function(){e.getProducts(!1,!0),e.loadMoreLoading=!1}),400))}}},k=Object(v.a)(x,(function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("main",{staticClass:"main"},[r("page-header",{attrs:{title:e.pageTitle,subtitle:"Shop"}}),e._v(" "),r("nav",{staticClass:"breadcrumb-nav mb-2",attrs:{"aria-label":"breadcrumb"}},[r("div",{class:e.containerClass},[r("ol",{staticClass:"breadcrumb"},[r("li",{staticClass:"breadcrumb-item"},[r("nuxt-link",{attrs:{to:"/"}},[e._v("Home")])],1),e._v(" "),r("li",{staticClass:"breadcrumb-item"},[r("nuxt-link",{attrs:{to:"/shop/sidebar/list"}},[e._v("Shop")])],1),e._v(" "),r("li",{staticClass:"breadcrumb-item active"},[e._v(e._s(e.pageTitle))]),e._v(" "),e.$route.query.searchTerm?r("li",{staticClass:"breadcrumb-item"},[r("span",[e._v("Search - "+e._s(e.$route.query.searchTerm))])]):e._e()])])]),e._v(" "),r("div",{staticClass:"page-content"},[r("div",{class:e.containerClass},[r("div",{staticClass:"toolbox"},[r("div",{staticClass:"toolbox-left"},[r("a",{staticClass:"sidebar-toggler mr-0 mr-md-5",attrs:{href:"#"},on:{click:function(t){return t.preventDefault(),e.showSidebar(t)}}},[r("i",{staticClass:"icon-bars"}),e._v("Filters\n          ")])]),e._v(" "),r("div",{staticClass:"toolbox-center"},[r("div",{staticClass:"toolbox-info"},[e._v("\n            Showing\n            "),r("span",[e._v(e._s(e.products.length)+" of "+e._s(e.totalCount))]),e._v("\n            Products\n          ")])]),e._v(" "),r("div",{staticClass:"toolbox-right"},[r("div",{staticClass:"toolbox-sort"},[r("label",{attrs:{for:"sortby"}},[e._v("Sort by:")]),e._v(" "),r("div",{staticClass:"select-custom"},[r("select",{directives:[{name:"model",rawName:"v-model",value:e.orderBy,expression:"orderBy"}],staticClass:"form-control",attrs:{name:"sortby",id:"sortby"},on:{change:[function(t){var r=Array.prototype.filter.call(t.target.options,(function(e){return e.selected})).map((function(e){return"_value"in e?e._value:e.value}));e.orderBy=t.target.multiple?r:r[0]},function(t){return t.preventDefault(),e.getProducts(t)}]}},[r("option",{attrs:{value:"default"}},[e._v("Default")]),e._v(" "),r("option",{attrs:{value:"featured"}},[e._v("Most Popular")]),e._v(" "),r("option",{attrs:{value:"rating"}},[e._v("Most Rated")]),e._v(" "),r("option",{attrs:{value:"new"}},[e._v("Date")])])])])])]),e._v(" "),r("shop-list-three",{staticClass:"skeleton-body skel-shop-products",class:{loaded:e.loaded},attrs:{products:e.products,"per-page":e.perPage,loaded:e.loaded}}),e._v(" "),r("div",{staticClass:"load-more-container text-center"},[e.loadMoreLoading||e.hasMore?r("a",{staticClass:"btn btn-outline-darker btn-load-more",attrs:{href:"#"},on:{click:function(t){return t.preventDefault(),e.loadMore(t)}}},[e._v("\n          More Products\n          "),r("i",{staticClass:"icon-refresh",class:{"load-more-rotating":e.loadMoreLoading}})]):e._e()]),e._v(" "),r("div",{staticClass:"sidebar-filter-overlay",on:{click:e.hideSidebar}}),e._v(" "),r("shop-sidebar-one",{attrs:{"is-sidebar":!0}})],1)])],1)}),[],!1,null,null,null);t.default=k.exports}}]);