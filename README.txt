ABOUT:
--------------------------------------------------------------------
For this project, I have created a simple EER diagram, which I will
base everything on - each project is the same, just written for a 
different SQL DSL. The purpose is not to design a complex or useful
database, but to explore the direct differences between SQL DSL's. 
The main focus is to use every procedural-language feature. This 
includes stored procedures, functions, sequences, events, and any 
other language-specific features that might be available. 
The database schema is comprised of three entities, in Union. Each
folder targets one DSL, and includes a batch script, which proves
the functionality of every script. Running this is like running a set
of unit tests that arent integrated with anything. The functionality
of each script focuses on one aspect of data definition or 
manipulation. To see the intended order of execution, view the related 
batch script.

THE DATA:
--------------------------------------------------------------------
This is a really simple data model, which maps animals and plants to
a set of relational tables. Each Organism is either an Animal or a
Plant. The primary key of each subclass is also a foreign key, which
references the related superclass primary key. 
A few organisms are inserted, to prove all functionality. Where 
procedural alternatives have been created, a manual and procedural
implementation will also be provided (i.e. using both manual INSERT,
and a stored procedure, to do a similar task).

PROCEDURAL ELEMENTS:
--------------------------------------------------------------------
To ensure a procedure, function, and event are created and used, a
Setup.sql script has been provided for each project - this is where
all of these will be defined. 
The stored procedure turns a sequence of two INSERT statemets into a
single atom action, making writes simpler and more robust. The usage 
of this can be seen in Insert.sql. 
The function simply returns the average age of all organisms in the 
database. This utilized in Query.sql.
Finally, the stored event/trigger can only be found in the Setup file.
It is called whenever a colour is inserted, and automatically prefixes
it with 'rgb_'. Proof of this functionality can be seen when Query.sql
is called, because the colour (including the prefix) will be displayed
in the terminal.
The Insert statements are all performed inside a procedural block, 
which is specific to each language.

RUN:
--------------------------------------------------------------------
Make sure you have a valid RDBMS installed, running, and connected.
It must be compatible and configured to run with the relevant DSL.
Each folder focuses on a different relational database, so the batch
script will automatically prove the full database lifecycle.