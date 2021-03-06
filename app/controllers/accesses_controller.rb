require 'filter_cookie_values'

class AccessesController < ApplicationController
  skip_before_filter :verify_authenticy_token, :only => [:create]

  # GET /accesses
  # GET /accesses.json
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @accesses = Access.order("created_at DESC").paginate(page: page, per_page: per_page)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accesses }
    end
  end

  # GET /accesses/1
  # GET /accesses/1.json
  def show
    @access = Access.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @access }
    end
  end

  # GET /accesses/new
  # GET /accesses/new.json
  def new
    create
  end

  # GET /accesses/1/edit
  def edit
    @access = Access.find(params[:id])
  end

  # POST /accesses
  # POST /accesses.json
  def create
    # CGI headers keys start with capital letters
    cgi_headers = request.headers.select {|key, val| key =~ /^[A-Z]/ }

    # filter HTTP_COOKIE values
    filter_cookie_values(cgi_headers, 'HTTP_COOKIE')

    @access = Access.new(headers: JSON.pretty_generate(cgi_headers.to_hash),
                         payload: JSON.pretty_generate(params.to_hash))

    respond_to do |format|
      if @access.save
        format.html { redirect_to @access, notice: 'Access was successfully created.' }
        format.json { render json: @access, status: :created, location: @access }
      else
        format.html { render action: "new" }
        format.json { render json: @access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accesses/1
  # PUT /accesses/1.json
  def update
    @access = Access.find(params[:id])

    respond_to do |format|
      if @access.update_attributes(params[:access])
        format.html { redirect_to @access, notice: 'Access was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accesses/1
  # DELETE /accesses/1.json
  def destroy
    @access = Access.find(params[:id])
    @access.destroy

    respond_to do |format|
      format.html { redirect_to accesses_url }
      format.json { head :no_content }
    end
  end
end
