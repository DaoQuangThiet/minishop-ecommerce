(window.webpackJsonp=window.webpackJsonp||[]).push([[56],{381:function(t,e,c){"use strict";c(17),c(11),c(12),c(7),c(16),c(25),c(26);var l=c(2),n=c(5);function r(object,t){var e=Object.keys(object);if(Object.getOwnPropertySymbols){var c=Object.getOwnPropertySymbols(object);t&&(c=c.filter((function(t){return Object.getOwnPropertyDescriptor(object,t).enumerable}))),e.push.apply(e,c)}return e}function o(t){for(var i=1;i<arguments.length;i++){var source=null!=arguments[i]?arguments[i]:{};i%2?r(Object(source),!0).forEach((function(e){Object(l.a)(t,e,source[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(source)):r(Object(source)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(source,e))}))}return t}var v={props:{title:{type:String,required:!0},subtitle:String},computed:o(o({},Object(n.c)("company",["getCompany"])),{},{pageTitle:function(){return this.$route.path.includes("wishlist")?"Yêu thích":this.$route.path.includes("account")?"Tài khoản":this.$route.path.includes("cart")?"Giỏ hàng":this.$route.path.includes("checkout")?"Đặt hàng":this.$route.path.includes("blog")?"Bài viết":this.$route.path.includes("about")?"Tài khoản":this.title}})},d=c(6),component=Object(d.a)(v,(function(){var t=this.$createElement,e=this._self._c||t;return e("div",{directives:[{name:"lazy",rawName:"v-lazy:background-image",value:"./images/page-header-bg.jpg",expression:"'./images/page-header-bg.jpg'",arg:"background-image"}],staticClass:"page-header text-center"},[e("div",{staticClass:"container"},[e("h1",{staticClass:"page-title"},[this._v("\n            "+this._s(this.pageTitle)+"\n            "),e("span",[this._v(this._s(this.getCompany.companyName))])])])])}),[],!1,null,null,null);e.a=component.exports},615:function(t,e,c){"use strict";c.r(e);var l=c(381),n={created:function(){document.querySelector("body").classList.remove("sidebar-filter-active")},methods:{cleanAllFilter:function(){for(var t=document.querySelectorAll(".sidebar-filter input[type=checkbox]"),i=0;i<t.length;i++)t[i].checked=!1},closeSidebar:function(){document.querySelector("body").classList.remove("sidebar-filter-active")}}},r=c(6),o=Object(r.a)(n,(function(){var t=this,e=t.$createElement,c=t._self._c||e;return c("aside",{staticClass:"sidebar-shop sidebar-filter sidebar-filter-banner"},[c("div",{staticClass:"sidebar-filter-wrapper"},[c("div",{staticClass:"widget widget-clean"},[c("button",{on:{click:t.closeSidebar}},[c("i",{staticClass:"icon-close"}),t._v("Filters\n            ")]),t._v(" "),c("a",{staticClass:"sidebar-filter-clear",attrs:{href:"#"},on:{click:function(e){return e.preventDefault(),t.cleanAllFilter(e)}}},[t._v("Clean All")])]),t._v(" "),t._m(0)])])}),[function(){var t=this,e=t.$createElement,c=t._self._c||e;return c("div",{staticClass:"widget"},[c("h3",{staticClass:"widget-title"},[t._v("Browse Category")]),t._v(" "),c("div",{staticClass:"widget-body"},[c("div",{staticClass:"filter-items filter-items-count"},[c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-1"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-1"}},[t._v("Women")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("3")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-2"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-2"}},[t._v("Men")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("0")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-3"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-3"}},[t._v("Holiday Shop")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("0")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-4"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-4"}},[t._v("Gifts")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("0")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-5"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-5"}},[t._v("Homeware")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("0")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-6",checked:"checked"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-6"}},[t._v("Grid Categories Fullwidth")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("13")])]),t._v(" "),c("div",{staticClass:"sub-filter-items"},[c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-7"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-7"}},[t._v("Dresses")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("3")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-8"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-8"}},[t._v("T-shirts")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("0")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-9"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-9"}},[t._v("Bags")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("4")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-10"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-10"}},[t._v("Jackets")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("2")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-11"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-11"}},[t._v("Shoes")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("2")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-12"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-12"}},[t._v("Jumpers")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("1")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-13"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-13"}},[t._v("Jeans")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("1")])]),t._v(" "),c("div",{staticClass:"filter-item"},[c("div",{staticClass:"custom-control custom-checkbox"},[c("input",{staticClass:"custom-control-input",attrs:{type:"checkbox",id:"cat-14"}}),t._v(" "),c("label",{staticClass:"custom-control-label",attrs:{for:"cat-14"}},[t._v("Sportwear")])]),t._v(" "),c("span",{staticClass:"item-count"},[t._v("0")])])])])])])}],!1,null,null,null).exports,v={components:{PageHeader:l.a,ShopSidebarTwo:o},methods:{openSidebar:function(){document.querySelector("body").classList.add("sidebar-filter-active")},closeSidebar:function(){document.querySelector("body").classList.remove("sidebar-filter-active")}}},d=Object(r.a)(v,(function(){var t=this,e=t.$createElement,c=t._self._c||e;return c("main",{staticClass:"main"},[c("page-header",{attrs:{title:"Product Category Boxed"}}),t._v(" "),c("nav",{staticClass:"breadcrumb-nav breadcrumb-with-filter"},[c("div",{staticClass:"container"},[c("button",{staticClass:"sidebar-toggler p-0",on:{click:t.openSidebar}},[c("i",{staticClass:"icon-bars"}),t._v("Filters\n      ")]),t._v(" "),c("ol",{staticClass:"breadcrumb"},[c("li",{staticClass:"breadcrumb-item"},[c("nuxt-link",{attrs:{to:"/"}},[t._v("Home")])],1),t._v(" "),c("li",{staticClass:"breadcrumb-item"},[c("nuxt-link",{attrs:{to:"/shop/sidebar/list"}},[t._v("Shop")])],1),t._v(" "),c("li",{staticClass:"breadcrumb-item"},[t._v("Product Category")]),t._v(" "),c("li",{staticClass:"breadcrumb-item active"},[t._v("Boxed")])])])]),t._v(" "),c("div",{staticClass:"page-content"},[c("div",{staticClass:"categories-page"},[c("div",{staticClass:"container"},[c("div",{staticClass:"row"},[c("div",{staticClass:"col-md-6"},[c("div",{staticClass:"banner banner-cat banner-badge"},[c("nuxt-link",{attrs:{to:"/shop/sidebar/list"}},[c("img",{directives:[{name:"lazy",rawName:"v-lazy",value:"./images/category/boxed/banner-1.jpg",expression:"'./images/category/boxed/banner-1.jpg'"}],attrs:{alt:"Banner"}})]),t._v(" "),c("nuxt-link",{staticClass:"banner-link",attrs:{to:"/shop/sidebar/3cols"}},[c("h3",{staticClass:"banner-title"},[t._v("Dresses")]),t._v(" "),c("h4",{staticClass:"banner-subtitle"},[t._v("3 Products")]),t._v(" "),c("span",{staticClass:"banner-link-text"},[t._v("Shop Now")])])],1),t._v(" "),c("div",{staticClass:"banner banner-cat banner-badge"},[c("nuxt-link",{attrs:{to:"/shop/sidebar/list"}},[c("img",{directives:[{name:"lazy",rawName:"v-lazy",value:"./images/category/boxed/banner-2.jpg",expression:"'./images/category/boxed/banner-2.jpg'"}],attrs:{alt:"Banner"}})]),t._v(" "),c("nuxt-link",{staticClass:"banner-link",attrs:{to:"/shop/sidebar/3cols"}},[c("h3",{staticClass:"banner-title"},[t._v("Jackets")]),t._v(" "),c("h4",{staticClass:"banner-subtitle"},[t._v("2 Products")]),t._v(" "),c("span",{staticClass:"banner-link-text"},[t._v("Shop Now")])])],1)]),t._v(" "),c("div",{staticClass:"col-md-6"},[c("div",{staticClass:"row"},[c("div",{staticClass:"col-sm-6"},[c("div",{staticClass:"banner banner-cat banner-badge"},[c("nuxt-link",{attrs:{to:"shop/sidebar/list"}},[c("img",{directives:[{name:"lazy",rawName:"v-lazy",value:"./images/category/boxed/banner-3.jpg",expression:"'./images/category/boxed/banner-3.jpg'"}],attrs:{alt:"Banner"}})]),t._v(" "),c("nuxt-link",{staticClass:"banner-link",attrs:{to:"shop/sidebar/3cols"}},[c("h3",{staticClass:"banner-title"},[t._v("T-shirts")]),t._v(" "),c("h4",{staticClass:"banner-subtitle"},[t._v("0 Products")]),t._v(" "),c("span",{staticClass:"banner-link-text"},[t._v("Shop Now")])])],1)]),t._v(" "),c("div",{staticClass:"col-sm-6"},[c("div",{staticClass:"banner banner-cat banner-badge"},[c("nuxt-link",{attrs:{to:"shop/sidebar/list"}},[c("img",{directives:[{name:"lazy",rawName:"v-lazy",value:"./images/category/boxed/banner-4.jpg",expression:"'./images/category/boxed/banner-4.jpg'"}],attrs:{alt:"Banner"}})]),t._v(" "),c("nuxt-link",{staticClass:"banner-link",attrs:{to:"shop/sidebar/3cols"}},[c("h3",{staticClass:"banner-title"},[t._v("Jeans")]),t._v(" "),c("h4",{staticClass:"banner-subtitle"},[t._v("1 Products")]),t._v(" "),c("span",{staticClass:"banner-link-text"},[t._v("Shop Now")])])],1)])]),t._v(" "),c("div",{staticClass:"banner banner-cat banner-badge"},[c("nuxt-link",{attrs:{to:"/shop/sidebar/list"}},[c("img",{directives:[{name:"lazy",rawName:"v-lazy",value:"./images/category/boxed/banner-5.jpg",expression:"'./images/category/boxed/banner-5.jpg'"}],attrs:{alt:"Banner"}})]),t._v(" "),c("nuxt-link",{staticClass:"banner-link",attrs:{to:"/shop/sidebar/3cols"}},[c("h3",{staticClass:"banner-title"},[t._v("Bags")]),t._v(" "),c("h4",{staticClass:"banner-subtitle"},[t._v("4 Products")]),t._v(" "),c("span",{staticClass:"banner-link-text"},[t._v("Shop Now")])])],1)]),t._v(" "),c("div",{staticClass:"col-sm-6 col-md-3"},[c("div",{staticClass:"banner banner-cat banner-badge"},[c("nuxt-link",{attrs:{to:"/shop/sidebar/list"}},[c("img",{directives:[{name:"lazy",rawName:"v-lazy",value:"./images/category/boxed/banner-6.jpg",expression:"'./images/category/boxed/banner-6.jpg'"}],attrs:{alt:"Banner"}})]),t._v(" "),c("nuxt-link",{staticClass:"banner-link",attrs:{to:"/shop/sidebar/3cols"}},[c("h3",{staticClass:"banner-title"},[t._v("Sportwear")]),t._v(" "),c("h4",{staticClass:"banner-subtitle"},[t._v("0 Products")]),t._v(" "),c("span",{staticClass:"banner-link-text"},[t._v("Shop Now")])])],1)]),t._v(" "),c("div",{staticClass:"col-sm-6 col-md-3 order-md-last"},[c("div",{staticClass:"banner banner-cat banner-badge"},[c("nuxt-link",{attrs:{to:"/shop/sidebar/list"}},[c("img",{directives:[{name:"lazy",rawName:"v-lazy",value:"./images/category/boxed/banner-8.jpg",expression:"'./images/category/boxed/banner-8.jpg'"}],attrs:{alt:"Banner"}})]),t._v(" "),c("nuxt-link",{staticClass:"banner-link",attrs:{to:"/shop/sidebar/3cols"}},[c("h3",{staticClass:"banner-title"},[t._v("Jumpers")]),t._v(" "),c("h4",{staticClass:"banner-subtitle"},[t._v("1 Products")]),t._v(" "),c("span",{staticClass:"banner-link-text"},[t._v("Shop Now")])])],1)]),t._v(" "),c("div",{staticClass:"col-md-6"},[c("div",{staticClass:"banner banner-cat banner-badge"},[c("nuxt-link",{attrs:{to:"/shop/sidebar/list"}},[c("img",{directives:[{name:"lazy",rawName:"v-lazy",value:"./images/category/boxed/banner-7.jpg",expression:"'./images/category/boxed/banner-7.jpg'"}],attrs:{alt:"Banner"}})]),t._v(" "),c("nuxt-link",{staticClass:"banner-link",attrs:{to:"/shop/sidebar/3cols"}},[c("h3",{staticClass:"banner-title"},[t._v("Shoes")]),t._v(" "),c("h4",{staticClass:"banner-subtitle"},[t._v("2 Products")]),t._v(" "),c("span",{staticClass:"banner-link-text"},[t._v("Shop Now")])])],1)])])])]),t._v(" "),c("div",{staticClass:"sidebar-filter-overlay",on:{click:t.closeSidebar}}),t._v(" "),c("shop-sidebar-two")],1)],1)}),[],!1,null,null,null);e.default=d.exports}}]);