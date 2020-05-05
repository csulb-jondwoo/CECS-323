CREATE TABLE 'Customer' {
    'Account#' VARCHAR NOT NULL,
    'City' VARCHAR,
    'Address' VARCHAR,
    'State' VARCHAR(2),
    'CustName' VARCHAR,
    'Miming Money' INTEGER DEFAULT NULL
    CONSTRAINT 'CUSTOMERS_PK' PRIMARY KEY('Account#'),
    CONSTRAINT 'CUSTOMERS_CK1' KEY('City','Address','State','CustName'),
};

CREATE TABLE 'Individual_Customer' {
    'Account#' VARCHAR NOT NULL,
    'EmailAddress' VARCHAR(25) NOT NULL,
    'DOB' DATE NOT NULL,
    CONSTRAINT 'IND_CUSTOMERS_PK' PRIMARY KEY('Account#'),
    CONSTRAINT 'INDIVIDUAL_CK1' KEY('City','Address','State','CustName'),
    CONSTRAINT 'ind_customer_fk1' FOREIGN KEY ('Account#') REFERENCES 'Customer'
};

CREATE TABLE 'Company_Customer' {
    'Account#' VARCHAR NOT NULL,
    'CompanyDep' VARCHAR,
    'CompanyName' VARCHAR,
    'ContactEmail' VARCHAR,
    'ContactPhone' VARCHAR,
    CONSTRAINT 'COMP_CUSTOMERS_PK' PRIMARY KEY('Account#'),
    CONSTRAINT 'COMPANY_CK1' KEY('CompanyDep','CompnayName','ContactEmail','ContactPhone'),
    CONSTRAINT 'comp_customer_fk1' FOREIGN KEY ('Account#') REFERENCES 'Customer'
};
