require 'spec_helper'

describe ProjectsHelper do
  describe '#put_project_source_state' do
    g = 'good'
    b = 'bad'
    d = 'grave'

    it 'should return good' do
      put_project_source_state(g, g, g).should == 'good'
    end

    it 'should not return good' do
      put_project_source_state(b, g, g).should_not == 'good'
    end

    it 'should not return good' do
      put_project_source_state(g, g, d).should_not == 'good'
    end

    it 'should not return good' do
      put_project_source_state(b, b, b).should_not == 'good'
    end

    it 'should not return good' do
      put_project_source_state(d, d, d).should_not == 'good'
    end

    it 'should return warning' do
      put_project_source_state(g, b, g).should == 'warning'
    end

    it 'should return warning' do
      put_project_source_state(b, b, b).should == 'warning'
    end

    it 'should return warning' do
      put_project_source_state(b, g, b).should == 'warning'
    end

    it 'should not return waning' do
      put_project_source_state(g, g, g).should_not == 'warning'
    end

    it 'should not return warning' do
      put_project_source_state(b, b, d).should_not == 'waning'
    end

    it 'should not return waning' do
      put_project_source_state(b, d, b).should_not == 'warning'
    end

    it 'should not return warning' do
      put_project_source_state(d, d, d).should_not == 'warning'
    end

    it 'should return bad' do
      put_project_source_state(d, d, d).should == 'bad'
    end

    it 'should return bad' do
      put_project_source_state(g, g, d).should == 'bad'
    end

    it 'should return bad' do
      put_project_source_state(b, b, d).should == 'bad'
    end

    it 'should return bad' do
      put_project_source_state(d, b, d).should == 'bad'
    end

    it 'should return bad' do
      put_project_source_state(d, g, d).should == 'bad'
    end

    it 'should return bad' do
      put_project_source_state(d, d, d).should == 'bad'
    end

    it 'should not return bad' do
      put_project_source_state(g, g, b).should_not == 'bad'
    end

    it 'should not return bad' do
      put_project_source_state(g, g, g).should_not == 'bad'
    end
    it 'should not return bad' do
      put_project_source_state(b, g, b).should_not == 'bad'
    end
    it 'should not return bad' do
      put_project_source_state(b, b, b).should_not == 'bad'
    end
  end
end
