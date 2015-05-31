# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Database.destroy_all
Table.destroy_all
Field.destroy_all
Relationship.destroy_all
User.destroy_all


u1  = User.create :email => 'admin@site', :admin => true, :password => 'password'

d1 = Database.create :name => 'Test Database', :tablenum => 1

t1 = Table.create :name => 'Test Table', :fieldnum => 2

r1 = Relationship.create :name => 'has_one'
r2 = Relationship.create :name => 'has_many'
r3 = Relationship.create :name => 'has_one :through'
r4 = Relationship.create :name => 'has_many :through'
r5 = Relationship.create :name => 'belongs_to'
r6 = Relationship.create :name => 'has_and_belongs_to_many'

f1 = Field.create( :name => 'hello', :fieldtype => "string"  )
f2 = Field.create( :name => 'age', :fieldtype => "integer"  )

t1.relationships << r1 << r2 << r3 << r4 << r5 << r6
t1.fields << f1

u1.databases << d1
d1.tables << t1 




# bigint  int8  signed eight-byte integer
# bigserial serial8 autoincrementing eight-byte integer
# bit [ (n) ]   fixed-length bit string
# bit varying [ (n) ] varbit  variable-length bit string
# boolean bool  logical Boolean (true/false)
# box   rectangular box on a plane
# bytea   binary data ("byte array")
# character [ (n) ] char [ (n) ]  fixed-length character string
# character varying [ (n) ] varchar [ (n) ] variable-length character string
# cidr    IPv4 or IPv6 network address
# circle    circle on a plane
# date    calendar date (year, month, day)
# double precision  float8  double precision floating-point number (8 bytes)
# inet    IPv4 or IPv6 host address
# integer int, int4 signed four-byte integer
# interval [ fields ] [ (p) ]   time span
# json    JSON data
# line    infinite line on a plane
# lseg    line segment on a plane
# macaddr   MAC (Media Access Control) address
# money   currency amount
# numeric [ (p, s) ]  decimal [ (p, s) ]  exact numeric of selectable precision
# path    geometric path on a plane
# point   geometric point on a plane
# polygon   closed geometric path on a plane
# real  float4  single precision floating-point number (4 bytes)
# smallint  int2  signed two-byte integer
# smallserial serial2 autoincrementing two-byte integer
# serial  serial4 autoincrementing four-byte integer
# text    variable-length character string
# time [ (p) ] [ without time zone ]    time of day (no time zone)
# time [ (p) ] with time zone timetz  time of day, including time zone
# timestamp [ (p) ] [ without time zone ]   date and time (no time zone)
# timestamp [ (p) ] with time zone  timestamptz date and time, including time zone
# tsquery   text search query
# tsvector    text search document
# txid_snapshot   user-level transaction ID snapshot
# uuid    universally unique identifier
# xml   XML data