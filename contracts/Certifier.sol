pragma solidity ^0.4.23;

contract Certifier {

    address public owner;
    uint public last_completed_migration;

    mapping(bytes32 => Course) courses;

    struct Course { 
        string name;
        uint cost; 
        uint duration; 
        uint threshold;
        bytes32[] codes;
        mapping(address => Student) students;
    }

    struct Student {
        string firstName;
        string lastName;
        uint age;
        string email;
        bytes32[] codes; 
    }

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted() {
        require (msg.sender == owner); 
        _;
    }

    function isOwner() public view returns(bool) {
        return msg.sender == owner;
    }

    function addCourse(bytes32 _code,  string _name,  uint _cost,  uint _duration, uint _threshold, bytes32[] _codes) public restricted {
        courses[_code] = Course({
            name: _name,
            cost: _cost,
            duration: _duration,
            threshold: _threshold,
            codes: _codes 
        });
    }

    function getCourse(bytes32 _code) public restricted view returns(string, uint, uint, uint, bytes32[]) {
        Course storage course = courses[_code];
        return(course.name, course.cost, course.duration, course.threshold, course.codes);
    }

    function subscribe(bytes32 _code, string _firstName, string _lastName, uint _age, string _email) public payable {
        require(msg.value == 3 ether, "You have payed 3 ether");
        Course storage course = courses[_code];
        course.students[msg.sender] = Student({
            firstName: _firstName,
            lastName: _lastName,
            age: _age,
            email: _email,
            codes: new bytes32[](0)
        });
    }
}
