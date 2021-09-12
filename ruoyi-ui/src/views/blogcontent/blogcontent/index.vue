<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="标题" prop="blogTitle">
        <el-input
          v-model="queryParams.blogTitle"
          placeholder="请输入标题"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="访问名" prop="blogSlug">
        <el-input
          v-model="queryParams.blogSlug"
          placeholder="请输入访问名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="blogCreated">
        <el-input
          v-model="queryParams.blogCreated"
          placeholder="请输入创建时间"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="修改时间" prop="blogModified">
        <el-input
          v-model="queryParams.blogModified"
          placeholder="请输入修改时间"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="排序编号" prop="blogOrder">
        <el-input
          v-model="queryParams.blogOrder"
          placeholder="请输入排序编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模板id" prop="blogTemplate">
        <el-input
          v-model="queryParams.blogTemplate"
          placeholder="请输入模板id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="主体类型" prop="blogType">
        <el-select v-model="queryParams.blogType" placeholder="请选择主体类型" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="主体状态" prop="blogStatus">
        <el-select v-model="queryParams.blogStatus" placeholder="请选择主体状态" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="密码" prop="blogPassword">
        <el-input
          v-model="queryParams.blogPassword"
          placeholder="请输入密码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="评论数量" prop="blogCommentsnum">
        <el-input
          v-model="queryParams.blogCommentsnum"
          placeholder="请输入评论数量"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否允许评论" prop="blogAllowcomment">
        <el-input
          v-model="queryParams.blogAllowcomment"
          placeholder="请输入是否允许评论"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否允许feed" prop="blogAllowfeed">
        <el-input
          v-model="queryParams.blogAllowfeed"
          placeholder="请输入是否允许feed"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属分类" prop="blogParent">
        <el-input
          v-model="queryParams.blogParent"
          placeholder="请输入所属分类"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="操作用户" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入操作用户"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['blogcontent:blogcontent:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blogcontent:blogcontent:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blogcontent:blogcontent:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['blogcontent:blogcontent:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="blogcontentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="blogCid" />
      <el-table-column label="标题" align="center" prop="blogTitle" />
      <el-table-column label="访问名" align="center" prop="blogSlug" />
      <el-table-column label="创建时间" align="center" prop="blogCreated" />
      <el-table-column label="修改时间" align="center" prop="blogModified" />
      <el-table-column label="主体内容" align="center" prop="blogText" />
      <el-table-column label="排序编号" align="center" prop="blogOrder" />
      <el-table-column label="模板id" align="center" prop="blogTemplate" />
      <el-table-column label="主体类型" align="center" prop="blogType" />
      <el-table-column label="主体状态" align="center" prop="blogStatus" />
      <el-table-column label="密码" align="center" prop="blogPassword" />
      <el-table-column label="评论数量" align="center" prop="blogCommentsnum" />
      <el-table-column label="是否允许评论" align="center" prop="blogAllowcomment" />
      <el-table-column label="是否允许feed" align="center" prop="blogAllowfeed" />
      <el-table-column label="所属分类" align="center" prop="blogParent" />
      <el-table-column label="操作用户" align="center" prop="userId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['blogcontent:blogcontent:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['blogcontent:blogcontent:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改blog主体内容对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="标题" prop="blogTitle">
          <el-input v-model="form.blogTitle" placeholder="请输入标题" />
        </el-form-item>
        <el-form-item label="访问名" prop="blogSlug">
          <el-input v-model="form.blogSlug" placeholder="请输入访问名" />
        </el-form-item>
        <el-form-item label="创建时间" prop="blogCreated">
          <el-input v-model="form.blogCreated" placeholder="请输入创建时间" />
        </el-form-item>
        <el-form-item label="修改时间" prop="blogModified">
          <el-input v-model="form.blogModified" placeholder="请输入修改时间" />
        </el-form-item>
        <el-form-item label="主体内容" prop="blogText">
          <el-input v-model="form.blogText" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="排序编号" prop="blogOrder">
          <el-input v-model="form.blogOrder" placeholder="请输入排序编号" />
        </el-form-item>
        <el-form-item label="模板id" prop="blogTemplate">
          <el-input v-model="form.blogTemplate" placeholder="请输入模板id" />
        </el-form-item>
        <el-form-item label="主体类型" prop="blogType">
          <el-select v-model="form.blogType" placeholder="请选择主体类型">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="主体状态">
          <el-radio-group v-model="form.blogStatus">
            <el-radio label="1">请选择字典生成</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="密码" prop="blogPassword">
          <el-input v-model="form.blogPassword" placeholder="请输入密码" />
        </el-form-item>
        <el-form-item label="评论数量" prop="blogCommentsnum">
          <el-input v-model="form.blogCommentsnum" placeholder="请输入评论数量" />
        </el-form-item>
        <el-form-item label="是否允许评论" prop="blogAllowcomment">
          <el-input v-model="form.blogAllowcomment" placeholder="请输入是否允许评论" />
        </el-form-item>
        <el-form-item label="是否允许feed" prop="blogAllowfeed">
          <el-input v-model="form.blogAllowfeed" placeholder="请输入是否允许feed" />
        </el-form-item>
        <el-form-item label="所属分类" prop="blogParent">
          <el-input v-model="form.blogParent" placeholder="请输入所属分类" />
        </el-form-item>
        <el-form-item label="操作用户" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入操作用户" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { listBlogcontent, getBlogcontent, delBlogcontent, addBlogcontent, updateBlogcontent } from "@/api/blogcontent/blogcontent";

  export default {
    name: "Blogcontent",
    data() {
      return {
        // 遮罩层
        loading: true,
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 显示搜索条件
        showSearch: true,
        // 总条数
        total: 0,
        // blog主体内容表格数据
        blogcontentList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          blogTitle: null,
          blogSlug: null,
          blogCreated: null,
          blogModified: null,
          blogText: null,
          blogOrder: null,
          blogTemplate: null,
          blogType: null,
          blogStatus: null,
          blogPassword: null,
          blogCommentsnum: null,
          blogAllowcomment: null,
          blogAllowfeed: null,
          blogParent: null,
          userId: null
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询blog主体内容列表 */
      getList() {
        this.loading = true;
        listBlogcontent(this.queryParams).then(response => {
          this.blogcontentList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
          blogCid: null,
          blogTitle: null,
          blogSlug: null,
          blogCreated: null,
          blogModified: null,
          blogText: null,
          blogOrder: null,
          blogTemplate: null,
          blogType: null,
          blogStatus: "0",
          blogPassword: null,
          blogCommentsnum: null,
          blogAllowcomment: null,
          blogAllowfeed: null,
          blogParent: null,
          userId: null
        };
        this.resetForm("form");
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1;
        this.getList();
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm("queryForm");
        this.handleQuery();
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.blogCid)
        this.single = selection.length!==1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加blog主体内容";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const blogCid = row.blogCid || this.ids
        getBlogcontent(blogCid).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改blog主体内容";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.blogCid != null) {
              updateBlogcontent(this.form).then(response => {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addBlogcontent(this.form).then(response => {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const blogCids = row.blogCid || this.ids;
        this.$confirm('是否确认删除blog主体内容编号为"' + blogCids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delBlogcontent(blogCids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('blogcontent/blogcontent/export', {
          ...this.queryParams
        }, `blogcontent_blogcontent.xlsx`)
      }
    }
  };
</script>
