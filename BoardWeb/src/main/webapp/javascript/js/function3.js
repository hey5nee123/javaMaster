// function3.js
// 객체생성: {}
let obj1 = {
    name: "홍길동",
    age: 20,
    showInfo: function () {
        return '이름은 ' + this.name + ', 나이는 ' + this.age;
    }
}
let obj2 = {
    name: "홍길동",
    age: 20,
    showInfo: function () {
        return '이름은 ' + this.name + ', 나이는 ' + this.age;
    }
}
// 함수를 통해 객체선언.
let Member = function Member(name, age) {
    this.name = name;
    this.age = age;
    this.showInfo = function () {
        return '이름은 ' + this.name + ', 나이는 ' + this.age;
    }
}
let obj3 = new Member("김명철", 22);
// let obj4 = new Member("이형섭", 25);
console.log(obj3.showInfo());
// console.log(obj4.showInfo());