%% GEOS397: HW1 Enterkine
% Homework #1: GIT, Markdown and MATLAB variables
% Due: 5:00 PM 09/02/16
% Please read the following questions carefully and make sure to answer the Parts completely. In your Markdown
% file, please include these questions and part numbers with your answers.
% 
% Part 1 (30 pts.)
% Make a Github account using your @u.boisestate.edu email address. Then, using the Github Desktop
% app, clone the master branch of the GEOS397 project to your local directory. Make a new branch called
% GEOS397 Lastname, where you insert your last name.
% 
    % Completed.
%%
% Part 2 (30 pts.)
% In your new branch, make an new file in the HW1 directory called HW1 Lastname.md.
% Use Markdown to write a summary of how you would go about ensuring that (if the clas had 10 students)
% you would partner with every other student for the 9 homework sets (you can write some equations if you
% want). Keep in mind that a constraint imposed on this problem is that no two students in the class can have
% repeat partners.

    % There is probably an easy way to do this with matrices, but my matrix
    % math is rusty. Thinking outside the box: each student is assigned a
    % prime number, stored as in an array of n students(studentArray).
    % Multiplying each prime number by every other prime number in the array
    % and an additional prime number (KEYPRIME) and storing them in an
    % array. A second iterator would then remove duplicate numbers from the
    % array and store as a new array (pairKeyArray). The list of sums would
    % allow retreival of each component number via some math and logic. I
    % think it would be something like "from 0 to 4 incremented by one,
    % select the next number in pairArray, divide it by KEYPRIME, divide by
    % each in studentArray, and if the result is an integer, remove the
    % entry from pairKeyArray, store both divisors in a new array (e.g.
    % homework1, homework2, etc.) unless one of the numbers already exists
    % in the homework array. If none of these conditions are met, try the
    % next number in pairArray" This would generate a list of five unique
    % pairs.

%%
    
% Part 3 (20 pts.)
% In the same file, list all of the possible variable types in MATLAB that are covered in the MATLAB style
% guide reading assignment. Also, give a description of each type and list why this is a useful type of variable.

    % logical: binary; useful for yes/no or true/false data.
    % char: characters; can store variables (e.g. 'A') or strings.
    % numeric: numbers (integer types, floating-point types); for numerical
        % data.
    % table: row/column container of mixed-type data; accessible through
        % index or row/column number.
    % cell: array of varying classes; for less-structured data packaging.
    % struct: array of varying classes; able to access one or all fields or
        %indices with one operation.
%%
        
% Part 4 (20 pts.)
% Based on the reading MatlabStyle1p5.pdf, give an example variable name for each of the variable types you
% identified in Part 3. Then compile (i.e.) save your Markdown file as an html file; also commit your changes
% to your specific GIT branch; DO NOT publish though.

    % logical: isNiceOutside
    % char: studentName
    % numeric: studentNo
    % table: warehouseInventory
    % cell: inmate
    % struct: student

% Email your html file to me at dylanmikesell@boisestate.edu with the following subject.
% ”GEOS397: HW1 Lastname”
%% 
