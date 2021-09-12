import request from '@/utils/request'

// 查询blog主体内容列表
export function listBlogcontent(query) {
  return request({
    url: '/blogcontent/blogcontent/list',
    method: 'get',
    params: query
  })
}

// 查询blog主体内容详细
export function getBlogcontent(blogCid) {
  return request({
    url: '/blogcontent/blogcontent/' + blogCid,
    method: 'get'
  })
}

// 新增blog主体内容
export function addBlogcontent(data) {
  return request({
    url: '/blogcontent/blogcontent',
    method: 'post',
    data: data
  })
}

// 修改blog主体内容
export function updateBlogcontent(data) {
  return request({
    url: '/blogcontent/blogcontent',
    method: 'put',
    data: data
  })
}

// 删除blog主体内容
export function delBlogcontent(blogCid) {
  return request({
    url: '/blogcontent/blogcontent/' + blogCid,
    method: 'delete'
  })
}
