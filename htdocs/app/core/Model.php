
<?php

class Model{
	protected static $_connection;
    protected $_className = null;
    protected $_PKName = 'ID';// default name for the primary key

    //protected $_select;//TODO: SELECT $this->_className.*
	//protected $_from;//TODO: FROM $this->_className
	//protected $_join;//TODO: JOIN $other ON $this->_className.$this->_PKName = $other::$_PKName
	protected $_whereClause;
    protected $_orderBy;

	
	public function __construct(PDO $connection = null)
    {
		//database parameters
		$server = 'localhost';
		$DBName = 'CarTrader';
		$user = 'root';
		$pass = '';
		
        self::$_connection = $connection;
        if (self::$_connection === null) {
            self::$_connection = new PDO("mysql:host=$server;dbname=$DBName", $user, $pass);
            self::$_connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
		$this->_className = get_class($this);
    }

	protected function getProps(){
		//extract the deriving class name
		$exclusions = get_class_vars(__CLASS__);//properties from the Model base class to exclude from SQL
		
        //extract the deriving class properties
        $classProps = [];
		$array = get_object_vars($this);
		foreach ($array as $key => $value) {
			if(!array_key_exists($key, $exclusions))
				$classProps[] = $key;
		}
		return $classProps;
	}
	
	protected function toArray($properties){
        $data = [];
        foreach($properties as $prop)
            $data[$prop] = $this->$prop;
		return $data;
    }

    public function find($ID)
    {
		$selectOne 	= "SELECT * FROM $this->_className WHERE $this->_PKName = :$this->_PKName";

        $stmt = self::$_connection->prepare($selectOne);
        $stmt->execute(array($this->_PKName=>$ID));

        $stmt->setFetchMode(PDO::FETCH_CLASS, $this->_className);
		$value = $stmt->fetch();
		//TODO: should this cause an exception when no record is found?
        return $value;
    }

    // SELECT * FROM Client WHERE firstName = 'Jon' AND lastName = 'Doe'
    public function where($field, $op, $value, $quote=true){
        //TODO : only if this is a string-type value
        if ($quote)
			$value = self::$_connection->quote($value);
        if($this->_whereClause == '')
            $this->_whereClause .= "WHERE $field $op $value";
        else
            $this->_whereClause .= " AND $field $op $value";
        return $this;
    }

    // SELECT * FROM Client ... ORDERBY firstName ASC, lastName ASC
    public function orderBy($field, $order = 'ASC'){
        if($this->_orderBy == '')
            $this->_orderBy .= "ORDERBY $field $order";
        else
            $this->_orderBy .= ", $field $order";
        return $this;
    }

	//run select statements
    public function get(){
		$select	= "SELECT * FROM $this->_className $this->_whereClause $this->_orderBy";
////TODO: send the actual data in the ->execute method to prevent SQL injection                         <-----
        $stmt = self::$_connection->prepare($select);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, $this->_className);
		return $stmt->fetchAll();
    }

	//don't insert the PK
    public function insert(){
		$properties = $this->getProps();
		$num = count($properties);
		$insert = '';
		if ($num  > 0){
			$insert 	= 'INSERT INTO ' . $this->_className . '(' . implode(',', $properties) . ') VALUES (:'. implode(',:', $properties) . ')';
		}				// INSERT INTO 			COUNTRY                 (code, name)                VALUES           (:code, :name)
        $stmt = self::$_connection->prepare($insert);
        $stmt->execute($this->toArray($properties));
	}		//        (['code'=>'CA', 'name' => 'Canada'])

	//need the PK to do anything
	public function update(){
		$properties = $this->getProps();
		$num = count($properties);
		$update = '';
		if ($num  > 0){
			//update
			$setClause = [];
			
			foreach($properties as $item)
				$setClause[] = sprintf('%s = :%s', $item, $item);    // '$item = :$item'
			$setClause = implode(', ', $setClause);
			$update = 'UPDATE ' . $this->_className . ' SET ' . $setClause . " WHERE $this->_PKName = :$this->_PKName";
		}   //         UPDATE         COUNTRY           SET code =: code, name =: name WHERE ID = :ID
		
        $stmt = self::$_connection->prepare($update);
		$properties[] = $this->_PKName;//add the primary key because it is required for the statement
        $stmt->execute($this->toArray($properties));
	}   // (['code'=>'CDN','name'=>'CANADA','ID'=>'2'])

	public function delete(){
		$delete = "DELETE FROM $this->_className WHERE $this->_PKName = :$this->_PKName";
        $stmt = self::$_connection->prepare($delete);
        $stmt->execute(array($this->_PKName=>$this->{$this->_PKName}));
	}   // 			      ['ID' => $this->ID]



}
?>