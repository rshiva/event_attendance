class User < ActiveRecord::Base
	belongs_to :events	

	 validates_presence_of :name , :mobile 


end
