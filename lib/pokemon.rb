class Pokemon
   
    attr_accessor :name, :type, :id, :db
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name,type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        db_search = <<-SQL
            SELECT * FROM pokemon WHERE pokemon.id = ?
        SQL
         y = db.execute(db_search, id).flatten
        Pokemon.new(id: y[0], name: y[1], type: y[2], db: db)
        # binding.pry
    end


end
