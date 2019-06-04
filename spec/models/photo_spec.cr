require "./spec_helper"
require "../../src/models/photo.cr"

describe Photo do
  Spec.before_each do
    Photo.clear
  end
end
