require 'spec_helper'

describe ProjectsHelper do
  g = 'good'
  b = 'bad'
  d = 'grave'

  n = 'Newest, secure code'
  o = 'Old, secure code'
  i = 'Insecure code'

  def project(ruby_project_source, rails_project_source, json_project_source, h1_deployment_state, h2_deployment_state, h3_deployment_state)
    project = Project.new(:ruby_project_source => ruby_project_source,
                          :rails_project_source => rails_project_source,
                          :json_project_source => json_project_source)

    project.hosts.build(:deployment_state => h1_deployment_state)
    project.hosts.build(:deployment_state => h2_deployment_state)
    project.hosts.build(:deployment_state => h3_deployment_state)

    project
  end

  describe '#project_source_state' do
    it 'should return good' do
      project_source_state(project(g, g, g, n, n, n)).should == 'good'
    end

    it 'should return bad' do
      project_source_state(project(d, d, d, n, n, n)).should == 'bad'
      project_source_state(project(g, g, d, n, n, n)).should == 'bad'
      project_source_state(project(d, b, d, n, n, n)).should == 'bad'
    end

    it 'should return warning' do
      project_source_state(project(g, b, g, n, n, n)).should == 'warning'
      project_source_state(project(b, b, b, n, n, n)).should == 'warning'
      project_source_state(project(b, g, b, n, n, n)).should == 'warning'
    end
  end

  describe '#overall_deployment_state' do
    it 'should return good' do
      overall_deployment_state(project(g, g, g,n,n,n)).should == 'good'
    end

    it 'should return bad' do
      overall_deployment_state(project(g, g, g, i, i, i)).should == 'bad'
      overall_deployment_state(project(g, g, g, i, n, n)).should == 'bad'
      overall_deployment_state(project(g, g, g, n, i, n)).should == 'bad'
    end

    it 'should return warning' do
      overall_deployment_state(project(g, g, g, o, o, o)).should == 'warning'
      overall_deployment_state(project(g, g, g, n, o, n)).should == 'warning'
      overall_deployment_state(project(g, g, g, o, n, n)).should == 'warning'
    end
  end

  describe '#project_overall_state' do
    it 'should return good' do
      project_overall_state(project(g, g, g, n, n, n)).should == 'good'
    end

    it 'should return bad' do
      project_overall_state(project(d, d, d, i, i, i)).should == 'bad'
      project_overall_state(project(g, g, d, i, n, n)).should == 'bad'
      project_overall_state(project(d, b, d, n, i, n)).should == 'bad'
    end

    it 'should return warning' do
      project_overall_state(project(g, b, g, o, o, o)).should == 'warning'
      project_overall_state(project(b, b, b, n, o, n)).should == 'warning'
      project_overall_state(project(b, g, b, o, n, n)).should == 'warning'
    end
  end
end
