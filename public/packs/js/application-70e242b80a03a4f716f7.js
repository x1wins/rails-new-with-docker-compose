/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/application.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/application.js":
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /myapp/app/javascript/packs/application.js: Unexpected token (33:33)\n\n  31 | import Chart from \"chartjs\";\n  32 | var ctx = document.getElementById('backlog-chart').getContext('2d');\n> 33 | var myChart = new Chart(ctx, {...});\n     |                                  ^\n    at Parser._raise (/myapp/node_modules/@babel/parser/lib/index.js:541:17)\n    at Parser.raiseWithData (/myapp/node_modules/@babel/parser/lib/index.js:534:17)\n    at Parser.raise (/myapp/node_modules/@babel/parser/lib/index.js:495:17)\n    at Parser.unexpected (/myapp/node_modules/@babel/parser/lib/index.js:3550:16)\n    at Parser.parseExprAtom (/myapp/node_modules/@babel/parser/lib/index.js:11857:22)\n    at Parser.parseExprSubscripts (/myapp/node_modules/@babel/parser/lib/index.js:11414:23)\n    at Parser.parseUpdate (/myapp/node_modules/@babel/parser/lib/index.js:11394:21)\n    at Parser.parseMaybeUnary (/myapp/node_modules/@babel/parser/lib/index.js:11369:23)\n    at Parser.parseMaybeUnaryOrPrivate (/myapp/node_modules/@babel/parser/lib/index.js:11183:61)\n    at Parser.parseExprOps (/myapp/node_modules/@babel/parser/lib/index.js:11190:23)\n    at Parser.parseMaybeConditional (/myapp/node_modules/@babel/parser/lib/index.js:11160:23)\n    at Parser.parseMaybeAssign (/myapp/node_modules/@babel/parser/lib/index.js:11123:21)\n    at /myapp/node_modules/@babel/parser/lib/index.js:11081:39\n    at Parser.allowInAnd (/myapp/node_modules/@babel/parser/lib/index.js:12928:12)\n    at Parser.parseMaybeAssignAllowIn (/myapp/node_modules/@babel/parser/lib/index.js:11081:17)\n    at Parser.parseSpread (/myapp/node_modules/@babel/parser/lib/index.js:10799:26)\n    at Parser.parsePropertyDefinition (/myapp/node_modules/@babel/parser/lib/index.js:12354:19)\n    at Parser.parseObjectLike (/myapp/node_modules/@babel/parser/lib/index.js:12290:25)\n    at Parser.parseExprAtom (/myapp/node_modules/@babel/parser/lib/index.js:11743:23)\n    at Parser.parseExprSubscripts (/myapp/node_modules/@babel/parser/lib/index.js:11414:23)\n    at Parser.parseUpdate (/myapp/node_modules/@babel/parser/lib/index.js:11394:21)\n    at Parser.parseMaybeUnary (/myapp/node_modules/@babel/parser/lib/index.js:11369:23)\n    at Parser.parseMaybeUnaryOrPrivate (/myapp/node_modules/@babel/parser/lib/index.js:11183:61)\n    at Parser.parseExprOps (/myapp/node_modules/@babel/parser/lib/index.js:11190:23)\n    at Parser.parseMaybeConditional (/myapp/node_modules/@babel/parser/lib/index.js:11160:23)\n    at Parser.parseMaybeAssign (/myapp/node_modules/@babel/parser/lib/index.js:11123:21)\n    at /myapp/node_modules/@babel/parser/lib/index.js:11081:39\n    at Parser.allowInAnd (/myapp/node_modules/@babel/parser/lib/index.js:12928:12)\n    at Parser.parseMaybeAssignAllowIn (/myapp/node_modules/@babel/parser/lib/index.js:11081:17)\n    at Parser.parseExprListItem (/myapp/node_modules/@babel/parser/lib/index.js:12669:18)");

/***/ })

/******/ });
//# sourceMappingURL=application-70e242b80a03a4f716f7.js.map