//https://anovanetworks.com/jobs/fpga-design-engineer/
//https://www.linkedin.com/company/sunrise-futures-llc/
//https://www.virtu.com/careers/
//https://www.eldoradotradinggroup.com/resources.html
//https://docs.google.com/spreadsheets/d/1pwq-2Hqhl6drXB67LuggCzNEqyCckYztzqVI7hDbNyQ/edit?pli=1#gid=0
/* Notes Taken From reading Section 10 of the 1800-2017 Standard  */
/*
Continous Assignment
    Valid Left hand side
        Assigns to net or variables
        Constant bit-select or part-select of a vector net or packed variable
        Concatenation or nested concat of any of the above

procedural assignment
    Valid Left Hand Side
        Variable
        bit-select or part select of variable
        Memory word
        Array, Array Elem Select, Array Slice,
        Concat of any of the above

Continous assign drives nets or vars in the same manner as a gate does, 
expression on the right hand side to be viewed of as a combinatioonal circuit that drives
the net or variable continously

Procedural Assignments by contrast put values in variables, assignment has no duration;
instead, the variable holds the value until the next procedural assignment is made to the variable.

Two additional assignment forms, assign/deassign and force/release, 
which are called PROCEDURAL CONTINOUS ASSIGNMENT
*/
//System Verilog also allows a time unit to be specified in the assignment statement
#1ns r = a;
r = #1ns a;
r <= #1ns a;
assign #2.5ns sum = a+b;

/*
Continous assignments shall drive values onto nets or variables. This assignment shall occur whenever the value 
of the right-hnd side changes. Provides a way to model combination logic without specifying an interconnnected gate
instead the model specifies the logical expression that drives the net or variables 

Two Forms:
1. Net Delcaration assignments
2. Continous assign statements

Net Declaration assignment
    - Place the net continous assignment in the same statement as its declaration   */
wire (strong1 pull0) mynet = enable;
/* As a result only one of these can be made for any given net. 

Continous Assign Statement
Any number can be done towards any net. Variables shall be explicityl declared prior to continous assignment
where as a net can be explictily declared or may inherit an implicit deccl. 
