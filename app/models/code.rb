require 'will_paginate'

class Code < ActiveRecord::Base
  belongs_to :user
end
