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

    //TODO: Student must enrolle
}
