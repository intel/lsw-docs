#!/usr/bin/env bash

base_dir=$HOME/flexran-development/networking.wireless.flexran.lsw-doc/
build_dir=$base_dir/build
pdf_dir=$build_dir/latex/
pdf_file_bname=latencysensitiveworkloadtuningguide.pdf
pdf_file=$pdf_dir/$pdf_file_bname
tmp_pdf_file=/tmp/$pdf_file_bname
default_branch_name=main
branch_name=review

if [ ! -d $base_dir ] ; then
    echo "Directory not found: ${base_dir}"
    exit 1
fi

cd $base_dir
if [ -d $build_dir ] ; then
    echo "Cleaning up any previous builds"
    rm -rf $build_dir
fi
if [ -f $pdf_file_bname ] ; then
    echo "Cleaning up previously generated PDF file"
    rm $pdf_file_bname
fi

echo "Switching to main branch"
git checkout $default_branch_name

echo "Pulling the latest changes to the repo"
git pull
if [ "$?" -ne "0" ] ; then
    echo "Failed to pull the latest changes"
    exit 1
fi

echo "Storing the latest git commit ID"
git_commit_id=$(git rev-parse HEAD)

echo "Generating an updated PDF version of the document"
make latexpdf

if [ ! -f $pdf_file ] ; then
    echo "File not found: ${pdf_file}"
    exit 1
fi

echo "Moving the PDF document to a temporary location"
mv $pdf_file /tmp/

git branch -l | grep -q $branch_name
if [ "$?" -ne "0" ] ; then
    echo "Creating the review branch"
    git branch $branch_name
    if [ "$?" -ne "0" ] ; then
	echo "Failed to create new branch"
	exit 1
    fi
fi

git checkout $branch_name
if [ "$?" -ne "0" ] ; then
    echo "Failed to checkout branch"
    exit 1
fi

echo "Moving the PDF document back and adding the PDF version to the review branch"
if [ ! -f $tmp_pdf_file ] ; then
    echo "File does not exist: ${tmp_pdf_file}"
    exit 1
fi

mv $tmp_pdf_file ./
git add $pdf_file_bname
if [ "$?" -ne "0" ] ; then
    echo "Failed to add PDF document"
    exit 1
fi

echo "Committing the changes using the latest git commit ID"
git commit -m "${git_commit_id}"
if [ "$?" -ne "0" ] ; then
    echo "Failed to commit changes"
    exit 1
fi

echo "Pushing the updates to the review branch"
git push --set-upstream origin $branch_name
if [ "$?" -ne "0" ] ; then
    echo "Failed to push updates"
    exit 1
fi

exit 0
